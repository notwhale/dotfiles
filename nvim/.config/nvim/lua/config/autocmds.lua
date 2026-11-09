-- Highlight selection on yank
vim.api.nvim_create_autocmd("TextYankPost", {
  group = vim.api.nvim_create_augroup("highlight_yank", { clear = true }),
  pattern = "*",
  desc = "highlight selection on yank",
  callback = function()
    vim.hl.on_yank({ timeout = 200, visual = true })
  end,
})

-- cmdhight recording macro workaround
if vim.o.cmdheight == 0 then
  vim.api.nvim_create_autocmd("RecordingEnter", { command = "set cmdheight=1" })
  vim.api.nvim_create_autocmd("RecordingLeave", { command = "set cmdheight=0" })
end
