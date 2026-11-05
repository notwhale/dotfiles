-- Shared scratchpad location. The directory is created on startup so nvim can
-- be launched there directly, without going through the tmux toggle script.

local M = {}

M.dir = vim.fs.normalize(vim.fn.expand(vim.env.SCRATCHPAD_DIR or "~/scratchpad"))
vim.fn.mkdir(M.dir, "p")

return M
