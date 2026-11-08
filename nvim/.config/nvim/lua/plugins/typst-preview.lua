-- chomosuke/typst-preview.nvim — low-latency Typst preview (tinymist backend).
-- Uses system binaries (homebrew tinymist + websocat), no plugin downloads.
-- Preview opens in the browser; updates on type with cross-jump.
require("typst-preview").setup({
  dependencies_bin = {
    tinymist = "/opt/homebrew/bin/tinymist",
    websocat = "/opt/homebrew/bin/websocat",
  },
  open_cmd = nil, -- default: browser via open
})

vim.keymap.set("n", "<leader>tp", "<cmd>TypstPreviewToggle<cr>", { desc = "Typst: Toggle Preview" })
