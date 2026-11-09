-- Native sessions, opt-in per directory. The session file is the switch:
-- :SessionSave creates it, then a bare `nvim` in that directory restores it
-- on start and saves it on exit. :SessionDelete turns it off. Sessions are
-- bound to the directory nvim was started in; :cd does not retarget them.
local dir = vim.fn.stdpath("state") .. "/sessions"
local cwd = vim.fs.normalize(vim.uv.cwd() or vim.fn.getcwd())
local file = dir .. "/" .. vim.fn.sha256(cwd) .. ".vim"
local bare = vim.fn.argc() == 0

vim.fn.mkdir(dir, "p")
vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize"

local function exists()
  return vim.fn.filereadable(file) == 1
end

local function save()
  vim.cmd("silent! mksession! " .. vim.fn.fnameescape(file))
end

-- Restore, then drop buffers whose files no longer exist: mksession would
-- otherwise recreate them as empty named buffers.
local function load()
  vim.cmd("silent! source " .. vim.fn.fnameescape(file))
  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    local name = vim.api.nvim_buf_get_name(buf)
    if name ~= "" and vim.bo[buf].buftype == "" and not vim.bo[buf].modified
        and vim.fn.filereadable(name) == 0 then
      pcall(vim.api.nvim_buf_delete, buf, { force = true })
    end
  end
end

vim.api.nvim_create_user_command("SessionSave", function()
  save()
  vim.notify("Session saved: " .. file)
end, { desc = "Save session for this directory" })

vim.api.nvim_create_user_command("SessionLoad", function()
  if exists() then
    load()
  else
    vim.notify("No session for " .. cwd, vim.log.levels.WARN)
  end
end, { desc = "Load session for this directory" })

vim.api.nvim_create_user_command("SessionDelete", function()
  vim.fn.delete(file)
  vim.notify("Session deleted: " .. file)
end, { desc = "Delete session for this directory" })

vim.keymap.set("n", "<leader>qs", "<cmd>SessionSave<cr>", { desc = "Session: Save" })
vim.keymap.set("n", "<leader>ql", "<cmd>SessionLoad<cr>", { desc = "Session: Load" })
vim.keymap.set("n", "<leader>qd", "<cmd>SessionDelete<cr>", { desc = "Session: Delete" })

vim.api.nvim_create_autocmd("VimEnter", {
  once = true,
  callback = function()
    if bare and exists() then
      load()
    end
  end,
})

vim.api.nvim_create_autocmd("VimLeavePre", {
  callback = function()
    if bare and exists() then
      save()
    end
  end,
})
