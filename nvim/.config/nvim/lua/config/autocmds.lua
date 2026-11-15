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

-- command-line autocompletion (:h cmdline-autocompletion)
vim.api.nvim_create_autocmd("CmdlineChanged", {
  group = vim.api.nvim_create_augroup("cmdline_completion", { clear = true }),
  pattern = "[/:?]",
  command = "lua vim.fn.wildtrigger()",
})

-- Scratchpad: autosave notes while editing in the scratch dir
local scratch = vim.fs.normalize(vim.fn.expand("~/scratchpad"))

vim.api.nvim_create_autocmd({ "TextChanged", "InsertLeave", "BufLeave", "FocusLost", "VimLeavePre" }, {
  group = vim.api.nvim_create_augroup("scratch", { clear = true }),
  desc = "autosave scratch notes",
  callback = function(args)
    local buf = args.buf
    if vim.fn.isdirectory(scratch) == 0 then
      vim.notify_once("scratchpad: directory not found: " .. scratch, vim.log.levels.WARN)
      return
    end
    if vim.fs.normalize(vim.uv.cwd() or "") ~= scratch or not vim.bo[buf].modified then
      return
    end
    local lines = vim.api.nvim_buf_get_lines(buf, 0, -1, false)
    if #lines == 1 and lines[1]:match("^%s*$") then
      return
    end
    if vim.api.nvim_buf_get_name(buf) == "" then
      vim.api.nvim_buf_set_name(buf, string.format("%s/scratch_%s.md", scratch, os.date("%Y-%m-%d_%H-%M-%S")))
      vim.bo[buf].filetype = "markdown"
    end
    if vim.bo[buf].buftype == "" and vim.fs.dirname(vim.api.nvim_buf_get_name(buf)) == scratch then
      vim.api.nvim_buf_call(buf, function()
        vim.cmd("silent write")
      end)
    end
  end,
})
