-- stevearc/conform.nvim — formatter registry + :Format with LSP fallback.
-- Formatter binaries checked at runtime: missing ones are skipped, unknown
-- filetypes fall back to LSP formatting.
require("conform").setup({
  formatters_by_ft = {
    lua = { "stylua" },
    bash = { "shfmt" },
    go = { "gofmt" },
    python = { "ruff_format", "black", stop_after_first = true },
    json = { "prettier" },
    yaml = { "prettier" },
    typst = { "typstyle" }, -- installed alongside tinymist when needed
  },
  -- formatters absent on this machine are just skipped; conform warns instead
  -- of failing (see notify_on_error)
  notify_on_error = false,
  format_on_save = false,
  -- format_on_save = { lsp_format = "fallback", timeout_ms = 500 },
})

vim.api.nvim_create_user_command("Format", function(args)
  local range = nil
  if args.count ~= -1 then
    local end_line = vim.api.nvim_buf_get_lines(0, args.line2, args.line2 + 1, true)[1]
    range = {
      start = { args.line1 + 1, 0 },
      ["end"] = { args.line2 + 1, end_line:len() },
    }
  end
  require("conform").format({ lsp_format = "fallback", range = range })
end, { range = true })

vim.keymap.set("n", "<leader>lf", function()
  require("conform").format({ lsp_format = "fallback" })
end, { desc = "Format buffer" })
vim.keymap.set("x", "<leader>lf", function()
  require("conform").format({ lsp_format = "fallback" })
end, { desc = "Format selection" })
