local wezterm = require("wezterm")

wezterm.font_with_fallback({
	{ family = "Monaspace Neon", weight = "Medium" },
	"Noto Color Emoji",
	"Symbols Nerd Font Mono",
})

return {
	front_end = "WebGpu",
	initial_rows = 55,
	initial_cols = 180,
	enable_wayland = true,
	cell_width = 1.0,
	dpi = 96.0,
	window_padding = {
		left = 0,
		right = 0,
		top = 0,
		bottom = 0,
	},
	foreground_text_hsb = {
		hue = 1.0,
		saturation = 1.0,
		brightness = 1.15,
	},
	hide_tab_bar_if_only_one_tab = true,
	color_scheme = "Tokyo Night Moon",
	font_size = 10.2,
	freetype_render_target = "Normal",
	font = wezterm.font({
		family = "Monaspace Neon",
		weight = "Medium",
		harfbuzz_features = {
			"calt=1",
			"clig=1",
			"liga=1",
			"ss01=1",
			"ss02=1",
			"ss03=1",
			"ss04=1",
			"ss05=1",
			"ss06=1",
			"ss07=1",
			"ss08=1",
		},
	}),
	font_rules = {
		{
			intensity = "Bold",
			font = wezterm.font({
				family = "Monaspace Argon",
				weight = "Bold",
			}),
		},
		{
			intensity = "Normal",
			italic = true,
			font = wezterm.font({
				style = "Italic",
				family = "Monaspace Radon",
				weight = "Medium",
				italic = false,
			}),
		},
	},
}
