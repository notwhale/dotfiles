-- brianhuster/live-preview.nvim — on-request browser preview for Markdown,
-- AsciiDoc, HTML, SVG (live updates, no external deps; backend is pure Lua).
-- Always on-request: nothing renders in the buffer, no mode-switch jumping.
require("livepreview.config").set({
  autotoggle = false, -- preview only when explicitly requested
})

vim.keymap.set("n", "<leader>up", "<cmd>LivePreview toggle<cr>", { desc = "Preview: toggle in browser (md/adoc/html/svg)" })
