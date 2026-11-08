-- MeanderingProgrammer/render-markdown.nvim — in-buffer markdown rendering
-- (headings, tables, checkboxes, code blocks; cursor line stays raw).
-- Treesitter parsers: markdown, markdown_inline (already installed).
require("render-markdown").setup({
  filetype = { "markdown" },
  render_modes = { "n", "c", "t" },
})

vim.keymap.set("n", "<leader>um", "<cmd>RenderMarkdown toggle<cr>", { desc = "Toggle Markdown render" })
