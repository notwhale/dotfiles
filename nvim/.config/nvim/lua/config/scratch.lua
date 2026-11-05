-- Scratchpad mode: active when nvim runs in the configured scratchpad directory.

local dir = require("config.scratchpad").dir
local group = vim.api.nvim_create_augroup("scratch", { clear = true })

local function in_scratch()
	return vim.fs.normalize(vim.uv.cwd() or "") == dir
end

local function name_blank(buf)
	if not in_scratch() then
		return
	end
	if not vim.api.nvim_buf_is_valid(buf) then
		return
	end
	if vim.api.nvim_buf_get_name(buf) ~= "" or vim.bo[buf].buftype ~= "" then
		return
	end

	local modified = vim.bo[buf].modified
	local sec, usec = vim.uv.gettimeofday()
	local name = string.format(
		"%s/scratch_%s%03d.md",
		dir,
		os.date("%Y-%m-%d_%H-%M-%S", sec),
		math.floor(usec / 1000)
	)

	vim.api.nvim_buf_set_name(buf, name)
	vim.bo[buf].filetype = "markdown"
	vim.bo[buf].path = dir .. "/**"
	-- Naming can apply .editorconfig options (fileencoding), which marks the
	-- buffer modified. Keep an empty new buffer unmodified so it is only
	-- written after real edits.
	vim.bo[buf].modified = modified
end

-- Name any blank buffer the moment it is first edited. This covers both the
-- initial startup buffer and manually created ones; merely starting nvim or
-- restoring a session never creates a new scratch file.
vim.api.nvim_create_autocmd("BufModifiedSet", {
	group = group,
	callback = function(args)
		if vim.bo[args.buf].modified then
			name_blank(args.buf)
		end
	end,
})

-- Keep the startup blank buffer markdown-ready without naming or writing it.
vim.api.nvim_create_autocmd("VimEnter", {
	group = group,
	once = true,
	callback = function()
		local buf = vim.api.nvim_get_current_buf()
		if in_scratch() and vim.api.nvim_buf_get_name(buf) == "" and vim.bo[buf].buftype == "" then
			vim.bo[buf].filetype = "markdown"
		end
	end,
})

vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
	group = group,
	callback = function(args)
		local name = vim.api.nvim_buf_get_name(args.buf)
		if name == "" or vim.fs.dirname(name) ~= dir then
			return
		end
		vim.bo[args.buf].path = dir .. "/**"
		vim.opt_local.wrap = true
	end,
})

-- Explicit new scratch file: current window or a new full-screen tab.
local function new_scratch(tab)
	if tab then
		vim.cmd("tabnew")
	else
		vim.cmd("enew")
	end
	name_blank(vim.api.nvim_get_current_buf())
end

if in_scratch() then
	vim.keymap.set("n", "<leader>sn", function()
		new_scratch(false)
	end, { desc = "Scratch: New buffer" })
	vim.keymap.set("n", "<leader>sN", function()
		new_scratch(true)
	end, { desc = "Scratch: New tab" })
	vim.keymap.set("n", "<leader>sa", ":saveas " .. vim.fn.fnameescape(dir) .. "/", {
		desc = "Scratch: Save as",
	})
end

local function save(buf)
	if not vim.api.nvim_buf_is_valid(buf) or not vim.bo[buf].modified then
		return
	end
	local name = vim.api.nvim_buf_get_name(buf)
	if name == "" or vim.bo[buf].buftype ~= "" or vim.fs.dirname(name) ~= dir then
		return
	end
	vim.api.nvim_buf_call(buf, function()
		vim.cmd("silent write")
	end)
end

vim.api.nvim_create_autocmd({ "InsertLeave", "BufLeave", "FocusLost", "VimLeavePre" }, {
	group = group,
	callback = function()
		for _, buf in ipairs(vim.api.nvim_list_bufs()) do
			save(buf)
		end
	end,
})
