local M = {}

local nord_colors = {
	nord0 = "#2E3440",
	nord1 = "#3B4252",
	nord2 = "#434C5E",
	nord3 = "#4C566A",
	nord4 = "#D8DEE9",
	nord5 = "#E5E9F0",
	nord6 = "#ECEFF4",
	nord7 = "#8FBCBB",
	nord8 = "#88C0D0",
	nord9 = "#81A1C1",
	nord10 = "#5E81AC",
	nord11 = "#BF616A",
	nord12 = "#D08770",
	nord13 = "#EBCB8B",
	nord14 = "#A3BE8C",
	nord15 = "#B48EAD",
}

M.colors = {
	bg = "#1A1D24",
	fg = "#CFD7E5",

	bg_dark = "#161920",
	bg_light = "#242831",
	bg_visual = nord_colors.nord1,
	bg_cursorline = "#23272F",
	bg_search_result = nord_colors.nord13,

	fg_alt = "#B8C0CC",
	fg_dark = nord_colors.nord3,
	fg_gutter = nord_colors.nord3,

	comment = "#6E7B91",

	red = nord_colors.nord11,
	orange = nord_colors.nord12,
	yellow = nord_colors.nord13,
	green = nord_colors.nord14,
	cyan = nord_colors.nord8,
	blue = nord_colors.nord9,
	magenta = nord_colors.nord15,

	nord0 = nord_colors.nord0,
	nord1 = nord_colors.nord1,
	nord2 = nord_colors.nord2,
	nord3 = nord_colors.nord3,
	nord4 = nord_colors.nord4,
	nord5 = nord_colors.nord5,
	nord6 = nord_colors.nord6,
	nord7 = nord_colors.nord7,
	nord8 = nord_colors.nord8,
	nord9 = nord_colors.nord9,
	nord10 = nord_colors.nord10,
	nord11 = nord_colors.nord11,
	nord12 = nord_colors.nord12,
	nord13 = nord_colors.nord13,
	nord14 = nord_colors.nord14,
	nord15 = nord_colors.nord15,

	none = "NONE",
}

return M
