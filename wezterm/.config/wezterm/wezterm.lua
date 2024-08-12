local wezterm = require("wezterm")

local config = wezterm.config_builder()

config = {
	automatically_reload_config = true,
	enable_tab_bar = false,
	window_close_confirmation = "NeverPrompt",
	window_decorations = "RESIZE",
	default_cursor_style = "BlinkingBlock",
	cursor_blink_rate = 500,
	color_scheme = "Gruvbox Dark (Gogh)",
	font = wezterm.font("JetBrainsMono Nerd Font Mono", { weight = "Bold" }),
	font_size = 16,
	window_padding = {
		left = 2,
		right = 2,
		top = 0,
		bottom = 0,
	},
}

return config
