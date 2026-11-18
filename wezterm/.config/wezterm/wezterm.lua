local wezterm = require("wezterm")
local mux = wezterm.mux
local action = wezterm.action
local config = wezterm.config_builder()

local font_size = 10
if wezterm.target_triple:find("apple-darwin", 1, true) then
  font_size = 12
elseif wezterm.target_triple:find("linux", 1, true) then
  font_size = 10
end

wezterm.on("gui-startup", function(cmd)
  local tab, pane, window = mux.spawn_window(cmd or {})
  window:gui_window():maximize()
end)

config = {
  audible_bell = 'Disabled',
  automatically_reload_config = true,
  color_scheme = "Gruvbox Dark (Gogh)",
  cursor_blink_rate = 500,
  default_cursor_style = "BlinkingBlock",
  default_prog = { 'zsh', '-i', '-c', 'tmux attach || tmux new' },
  enable_tab_bar = false,
  font = wezterm.font("JetBrainsMono Nerd Font Mono", { weight = "Bold", italic = false }),
  font_size = font_size,
  native_macos_fullscreen_mode = true,
  send_composed_key_when_left_alt_is_pressed=false,
  send_composed_key_when_right_alt_is_pressed=false,
  use_dead_keys = false,
  window_close_confirmation = "NeverPrompt",
  window_decorations = "RESIZE",
  window_padding = { left = 2, right = 2, top = 0, bottom = 0, },
}

local editor = wezterm.shell_split(os.getenv("EDITOR") or "nvim")
table.insert(editor, os.getenv("WEZTERM_CONFIG_FILE"))

config.keys = {
  {
    key = ",",
    mods = "CTRL",
    action = action.SpawnCommandInNewTab({
      cwd = os.getenv("WEZTERM_CONFIG_DIR"),
      set_environment_variables = {
        TERM = "screen-256color",
      },
      args = editor,
    }),
  },
}

return config
