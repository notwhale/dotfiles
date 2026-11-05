-- Native sessions, opt-in per directory: run :SessionSave once to enable.
-- Session files live in stdpath("state")/sessions/<sha256(cwd)>.vim.

local dir = vim.fn.stdpath("state") .. "/sessions"
vim.fn.mkdir(dir, "p")

local cwd = vim.fs.normalize(vim.uv.cwd() or vim.fn.getcwd())
local session_file = dir .. "/" .. vim.fn.sha256(cwd) .. ".vim"
local scratch_dir = require("config.scratchpad").dir

vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize"

-- Only save on exit when this instance actually loaded/created a session.
local active = false

local function exists()
	return vim.fn.filereadable(session_file) == 1
end

local function save()
	vim.cmd("silent! mksession! " .. vim.fn.fnameescape(session_file))
end

vim.api.nvim_create_user_command("SessionSave", function()
	save()
	active = true
	vim.notify("Session saved: " .. session_file)
end, { desc = "Save session for the current directory" })

vim.api.nvim_create_user_command("SessionLoad", function()
	if exists() then
		vim.cmd("source " .. vim.fn.fnameescape(session_file))
		active = true
	else
		vim.notify("No session for " .. cwd, vim.log.levels.WARN)
	end
end, { desc = "Load session for the current directory" })

vim.api.nvim_create_user_command("SessionDelete", function()
	vim.fn.delete(session_file)
	active = false
	vim.notify("Session deleted: " .. session_file)
end, { desc = "Delete session for the current directory" })

vim.keymap.set("n", "<leader>qs", "<cmd>SessionSave<cr>", { desc = "Session: Save" })
vim.keymap.set("n", "<leader>ql", "<cmd>SessionLoad<cr>", { desc = "Session: Load" })
vim.keymap.set("n", "<leader>qd", "<cmd>SessionDelete<cr>", { desc = "Session: Delete" })

-- Restore only on a bare `nvim`, never when files were passed explicitly.
vim.api.nvim_create_autocmd("VimEnter", {
	once = true,
	callback = function()
		if vim.fn.argc() == 0 and exists() then
			vim.cmd("silent! source " .. vim.fn.fnameescape(session_file))
			active = true
		end
	end,
})

-- Auto-save only where a session was explicitly created, plus the scratchpad.
vim.api.nvim_create_autocmd("VimLeavePre", {
	callback = function()
		if active or cwd == scratch_dir then
			save()
		end
	end,
})
