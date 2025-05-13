local M = {}

M.colors = {
	-- Daric Core Colors
	bg = "#1A1D24", -- Màu nền siêu tối của Daric
	fg = "#CFD7E5", -- Màu chữ chính của Daric (hơi xám hơn Nord fg)

	-- Nord Palette (lấy từ nordic.nvim hoặc Nord spec, có thể điều chỉnh)
	nord0 = "#2E3440", -- Polar Night (Nền gốc Nord)
	nord1 = "#3B4252",
	nord2 = "#434C5E",
	nord3 = "#4C566A", -- Dùng cho comment, UI mờ

	nord4 = "#D8DEE9", -- Snow Storm (Chữ gốc Nord)
	nord5 = "#E5E9F0",
	nord6 = "#ECEFF4", -- Sáng nhất

	nord7 = "#8FBCBB", -- Frost - Teal/Greenish Cyan
	nord8 = "#88C0D0", -- Frost - Light Blue/Cyan
	nord9 = "#81A1C1", -- Frost - Medium Blue
	nord10 = "#5E81AC", -- Frost - Darker Blue

	nord11 = "#BF616A", -- Aurora - Red
	nord12 = "#D08770", -- Aurora - Orange
	nord13 = "#EBCB8B", -- Aurora - Yellow
	nord14 = "#A3BE8C", -- Aurora - Green
	nord15 = "#B48EAD", -- Aurora - Purple/Magenta

	-- Đặt tên gợi nhớ hơn cho các màu nhấn Daric (có thể giống hệt Nord hoặc đã được tinh chỉnh)
	red = M.colors.nord11,
	orange = M.colors.nord12,
	yellow = M.colors.nord13,
	green = M.colors.nord14,
	cyan = M.colors.nord8,
	blue = M.colors.nord9,
	magenta = M.colors.nord15,

	-- Màu cho các UI elements dựa trên palette
	bg_dark = "#161920",
	bg_light = "#242831",
	bg_visual = M.colors.nord1,
	bg_cursorline = "#23272F",

	fg_alt = "#B8C0CC",
	fg_dark = M.colors.nord3, -- Dùng nord3 cho comment mặc định nếu không có màu riêng
	fg_gutter = M.colors.nord3,

	comment = M.colors.nord3, -- Hoặc một màu xám dịu hơn nếu nord3 vẫn sáng

	none = "NONE",
}
-- Đảm bảo các màu được gán đúng (ví dụ trên có self-reference lỗi)
-- Cách đúng:
M.colors.red = M.colors.nord11
M.colors.orange = M.colors.nord12
M.colors.yellow = M.colors.nord13
M.colors.green = M.colors.nord14
M.colors.cyan = M.colors.nord8
M.colors.blue = M.colors.nord9
M.colors.magenta = M.colors.nord15
M.colors.comment = M.colors.nord3 -- Hoặc "#6E7B91" như trước
M.colors.fg_dark = M.colors.nord3
M.colors.fg_gutter = M.colors.nord3
M.colors.bg_visual = M.colors.nord1
-- Cần định nghĩa lại các màu như bg_dark, bg_light, bg_cursorline, fg_alt nếu chúng không phải là màu Nord gốc

return M
