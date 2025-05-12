local M = {}

M.colors = {
	-- Core Background & Foreground
	bg = "#1A1D24", -- Một màu xám rất đậm, tối hơn nord0 (#2E3440) đáng kể
	fg = "#CFD7E5", -- Hơi xám hơn và dịu hơn nord4 (#D8DEE9) một chút

	-- Supporting Backgrounds
	bg_dark = "#161920", -- Tối hơn bg chính, cho các thành phần ít nổi bật
	bg_light = "#242831", -- Sáng hơn bg chính, cho viền hoặc nền nổi bật nhẹ
	bg_visual = "#3B4252", -- nord1 (màu nền của Nord cho visual selection)
	bg_cursorline = "#23272F", -- Nền cho cursorline, gần với bg_light

	-- Supporting Foregrounds
	fg_alt = "#B8C0CC", -- Xám hơn fg chính, cho text phụ
	fg_dark = "#7E889A", -- Xám đậm, cho comment, text rất mờ
	fg_gutter = "#4C566A", -- nord3, cho line numbers, sign column

	-- Nord Palette (giữ lại để tham khảo và sử dụng trực tiếp nếu cần)
	nord0 = "#2E3440",
	nord1 = "#3B4252",
	nord2 = "#434C5E",
	nord3 = "#4C566A",
	nord4 = "#D8DEE9",
	nord5 = "#E5E9F0",
	nord6 = "#ECEFF4",

	-- Aurora & Frost (màu nhấn)
	red = "#BF616A", -- nord11
	orange = "#D08770", -- nord12
	yellow = "#EBCB8B", -- nord13
	green = "#A3BE8C", -- nord14
	cyan = "#88C0D0", -- nord8 (Frost - Light Blue/Cyan)
	blue = "#81A1C1", -- nord9 (Frost - Medium Blue)
	magenta = "#B48EAD", -- nord15 (Purple/Magenta)

	-- Specific UI elements
	comment = "#6E7B91", -- Xám xanh dương nhạt, tối và dịu hơn nord3

	none = "NONE",
}

return M
