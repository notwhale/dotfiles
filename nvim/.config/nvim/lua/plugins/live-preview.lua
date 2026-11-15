-- brianhuster/live-preview.nvim — on-request browser preview for Markdown,
-- AsciiDoc, HTML, SVG (live updates, no external deps; backend is pure Lua).
-- Always on-request: nothing renders in the buffer, no mode-switch jumping.
require("livepreview.config").set({
  autotoggle = false, -- preview only when explicitly requested
})

-- plugin has no :LivePreview toggle command — build one from its API
-- (M.start(filepath, port) starts the server but does NOT open the browser;
-- browser-open logic replicates the :LivePreview start command)
local function toggle()
  local lp = require("livepreview")
  local cfg = require("livepreview.config").config
  if lp.is_running() then
    lp.close()
    return
  end
  local filepath = vim.fs.normalize(vim.api.nvim_buf_get_name(0))
  lp.start(filepath, cfg.port)
  local urlpath = cfg.dynamic_root and vim.fs.basename(filepath)
    or require("livepreview.utils").get_relative_path(filepath, vim.fs.normalize(vim.uv.cwd() or ""))
  local url = ("http://%s:%d/%s"):format(cfg.address, cfg.port, vim.uri_encode(urlpath))
  vim.notify("Preview: " .. url)
  require("livepreview.utils").open_browser(url, cfg.browser)
end

vim.keymap.set("n", "<leader>up", toggle, { desc = "Preview: toggle in browser (md/adoc/html/svg)" })
