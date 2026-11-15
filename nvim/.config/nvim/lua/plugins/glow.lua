-- ellisonleao/glow.nvim — Markdown preview in a floating window via the glow
-- CLI (installed at /opt/homebrew/bin/glow). On-request only, closes with q.
require("glow").setup({
  glow_path = vim.fn.executable("glow") == 1 and vim.fn.exepath("glow") or nil,
  width_ratio = 0.85,
  height_ratio = 0.85,
})

vim.keymap.set("n", "<leader>um", "<cmd>Glow<cr>", { desc = "Preview: Markdown popup (glow)" })
