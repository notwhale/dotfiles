local wezterm = require("wezterm")
local mux = wezterm.mux
local action = wezterm.action
local config = wezterm.config_builder()

wezterm.on("gui-startup", function(cmd)
	local tab, pane, window = mux.spawn_window(cmd or {})
	window:gui_window():maximize()
end)

config = {
	automatically_reload_config = true,
	enable_tab_bar = false,
	window_close_confirmation = "NeverPrompt",
	window_decorations = "RESIZE",
	default_cursor_style = "BlinkingBlock",
	cursor_blink_rate = 500,
	color_scheme = "Gruvbox Dark (Gogh)",
	font = wezterm.font("JetBrainsMono Nerd Font Mono", { weight = "Bold", italic = false }),
	font_size = 12,
	window_padding = {
		left = 2,
		right = 2,
		top = 0,
		bottom = 0,
	},
	native_macos_fullscreen_mode = true,
	default_prog = {
		'zsh', '-i', '-c', 'tmux attach || tmux new'
	},
	audible_bell = 'Disabled',
	send_composed_key_when_left_alt_is_pressed=false,
	send_composed_key_when_right_alt_is_pressed=false,
	use_dead_keys = false
}

config.keys = {
	{
		key = ",",
		mods = "CMD",
		action = action.SpawnCommandInNewTab({
			cwd = os.getenv("WEZTERM_CONFIG_DIR"),
			set_environment_variables = {
				TERM = "screen-256color",
			},
			args = {
				"/opt/homebrew/bin/nvim",
				os.getenv("WEZTERM_CONFIG_FILE"),
			},
		}),
	},
}

return config
