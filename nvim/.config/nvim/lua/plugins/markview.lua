-- markview.nvim — in-buffer markdown (and LaTeX/typst/asciidoc) preview.
-- Loads after the colorscheme (highlight groups). Treesitter parsers:
-- markdown, markdown_inline (+ html, optional latex/typst/yaml).
require("markview").setup({
  preview = {
    enable = true,
    -- raw text under cursor stays editable in normal mode
    hybrid_modes = { "n" },
  },
})

vim.keymap.set("n", "<leader>um", "<cmd>Markview toggle<cr>", { desc = "Toggle Markdown preview" })
