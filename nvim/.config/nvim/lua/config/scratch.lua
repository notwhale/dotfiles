-- Scratchpad mode: active when nvim runs in the scratchpad directory.
-- Hot exit: a blank buffer becomes a dated scratch file on first edit and is
-- autosaved; :saveas (or :file) renames it and removes the scratch file.

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
  -- Naming can apply .editorconfig options (fileencoding), which marks the
  -- buffer modified. Keep an empty new buffer unmodified so it is only
  -- written after real edits.
  vim.bo[buf].modified = modified
end

-- Name any blank buffer the moment it is first edited, so autosave below
-- persists its content and the session restores it on next start.
vim.api.nvim_create_autocmd("BufModifiedSet", {
  group = group,
  callback = function(args)
    if vim.bo[args.buf].modified then
      name_blank(args.buf)
    end
  end,
})

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

-- After :saveas/:file renames a buffer away from its dated scratch name, the
-- scratch file on disk is no longer needed. The previous name is tracked per
-- buffer: :saveas also fires the pair for an unlisted helper buffer that
-- receives the old name, which would clobber a single variable.
local renamed_from = {}
vim.api.nvim_create_autocmd("BufFilePre", {
  group = group,
  callback = function(args)
    renamed_from[args.buf] = vim.api.nvim_buf_get_name(args.buf)
  end,
})
vim.api.nvim_create_autocmd("BufFilePost", {
  group = group,
  callback = function(args)
    local old, new = renamed_from[args.buf], vim.api.nvim_buf_get_name(args.buf)
    renamed_from[args.buf] = nil
    if not old or old == "" or new == old or vim.fs.basename(old):find("^scratch_%d") == nil then
      return
    end
    if vim.fs.dirname(old) == dir then
      os.remove(old) -- may not exist if never written; ignore
    end
  end,
})

if in_scratch() then
  vim.keymap.set("n", "<leader>sa", ":saveas " .. vim.fn.fnameescape(dir) .. "/", {
    desc = "Scratch: Save as",
  })
end
