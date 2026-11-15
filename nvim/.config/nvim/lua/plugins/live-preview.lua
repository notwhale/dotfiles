-- brianhuster/live-preview.nvim — on-request browser preview for Markdown,
-- AsciiDoc, HTML, SVG (live updates, no external deps; backend is pure Lua).
-- Always on-request: nothing renders in the buffer, no mode-switch jumping.
require("livepreview.config").set({
  autotoggle = false, -- preview only when explicitly requested
})

-- plugin has no :LivePreview toggle command — build one from its API
-- (start(filepath, port) needs the port explicitly)
local function toggle()
  local lp = require("livepreview")
  if lp.is_running() then
    lp.close()
  else
    lp.start(vim.api.nvim_buf_get_name(0), require("livepreview.config").config.port)
  end
end

vim.keymap.set("n", "<leader>up", toggle, { desc = "Preview: toggle in browser (md/adoc/html/svg)" })
