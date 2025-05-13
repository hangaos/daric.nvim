local M = {}

local function set_hl(group, opts)
	local success, err = pcall(vim.api.nvim_set_hl, 0, group, opts)
	if not success then
		-- vim.notify("Error setting integration highlight for " .. group .. ": " .. tostring(err), vim.log.levels.WARN)
	end
end

function M.apply(C, config)
	local float_actual_bg = config.transparent_floats and C.none or C.bg_dark
	local float_actual_blend = config.transparent_floats and config.float_blend or 0

	if config.transparent_floats then
		set_hl("NormalFloat", { bg = C.none, blend = float_actual_blend })
		set_hl("FloatBorder", { fg = C.nord3, bg = C.none, blend = float_actual_blend })
	else
		set_hl("NormalFloat", { fg = C.fg_alt, bg = C.bg_dark })
		set_hl("FloatBorder", { fg = C.nord3, bg = C.bg_dark })
	end
	set_hl("FloatTitle", { fg = C.blue, bg = float_actual_bg, bold = true })

	-- Lualine
	if package.loaded.lualine then
		-- For Lualine, it's best if the user sets `theme = 'auto'`
		-- or if we define a full lualine theme table and they use `theme = daric_lualine_theme_table`.
		-- For now, we'll set some common lualine groups that 'auto' might pick up or that override defaults.
		set_hl("lualine_a_normal", { fg = C.bg_dark, bg = C.blue, bold = true })
		set_hl("lualine_b_normal", { fg = C.fg, bg = C.bg_light })
		set_hl("lualine_c_normal", { fg = C.fg_alt, bg = C.bg_dark })
		set_hl("lualine_a_insert", { fg = C.bg_dark, bg = C.green, bold = true })
		set_hl("lualine_a_visual", { fg = C.bg_dark, bg = C.magenta, bold = true })
		set_hl("lualine_a_replace", { fg = C.bg_dark, bg = C.red, bold = true })
		set_hl("lualine_a_command", { fg = C.bg_dark, bg = C.orange, bold = true })
		set_hl("lualine_a_inactive", { fg = C.fg_dark, bg = C.bg_dark, bold = true })
		set_hl("lualine_b_inactive", { fg = C.fg_dark, bg = C.bg_dark })
		set_hl("lualine_c_inactive", { fg = C.fg_dark, bg = C.bg_dark })
	end

	-- Telescope
	set_hl("TelescopeNormal", { bg = float_actual_bg })
	set_hl("TelescopePromptNormal", { fg = C.fg, bg = C.bg_light })
	set_hl("TelescopeResultsNormal", { fg = C.fg, bg = C.bg })
	set_hl("TelescopePreviewNormal", { fg = C.fg, bg = C.bg })
	set_hl("TelescopeBorder", { fg = C.nord3, bg = float_actual_bg })
	set_hl("TelescopePromptTitle", { fg = C.blue, bg = C.bg_light, bold = true })
	set_hl("TelescopeResultsTitle", { fg = C.blue, bg = C.bg, bold = true })
	set_hl("TelescopePreviewTitle", { fg = C.blue, bg = C.bg, bold = true })
	set_hl("TelescopePromptPrefix", { fg = C.blue, bg = C.bg_light })
	set_hl("TelescopeSelection", { fg = C.nord6, bg = C.nord1, bold = true })
	set_hl("TelescopeMultiSelection", { link = "TelescopeSelection" })
	set_hl("TelescopeSelectionCaret", { fg = C.green, bg = C.nord1 })

	-- Neo-tree
	local neotree_actual_bg_val = C.bg
	set_hl("NeoTreeNormal", { fg = C.fg, bg = neotree_actual_bg_val })
	set_hl("NeoTreeNormalNC", { fg = C.fg_dark, bg = neotree_actual_bg_val })
	set_hl("NeoTreeDirectoryName", { fg = C.blue })
	set_hl("NeoTreeFileName", { fg = C.fg })
	set_hl("NeoTreeFileNameOpened", { fg = C.fg_alt, italic = true })
	set_hl("NeoTreeIndentMarker", { fg = C.nord2 })
	set_hl("NeoTreeExpander", { fg = C.nord3 })
	set_hl("NeoTreeGitModified", { fg = C.yellow })
	set_hl("NeoTreeGitAdded", { fg = C.green })
	set_hl("NeoTreeGitConflict", { fg = C.red })
	set_hl("NeoTreeWinSeparator", { fg = C.bg_light, bg = C.bg_light })
	if
		config.transparent_floats
		and vim.bo.filetype == "neo-tree"
		and vim.api.nvim_win_get_config(0).relative ~= ""
	then
		-- If neo-tree is floating and transparency is on
		set_hl("NeoTreeNormal", { fg = C.fg, bg = C.none, blend = float_actual_blend })
		set_hl("NeoTreeNormalNC", { fg = C.fg_dark, bg = C.none, blend = float_actual_blend })
	end
	set_hl("NeoTreeFloatBorder", { fg = C.nord3, bg = float_actual_bg })
	set_hl("NeoTreeFloatTitle", { fg = C.blue, bg = float_actual_bg })
	set_hl("NeoTreeFloatBackground", { bg = float_actual_bg })
	set_hl("NeoTreeDimmed", { link = "Comment" })

	-- Bufferline
	set_hl("BufferLineFill", { bg = C.bg_dark })
	set_hl("BufferLineBackground", { fg = C.fg_dark, bg = C.bg_dark })
	set_hl("BufferLineBufferVisible", { fg = C.fg_dark, bg = C.bg_dark })
	set_hl("BufferLineBufferSelected", { fg = C.nord6, bg = C.blue, bold = true, italic = false })
	set_hl("BufferLineIndicatorSelected", { fg = C.blue, bg = C.blue })
	set_hl("BufferLineCloseButton", { fg = C.fg_dark, bg = C.bg_dark })
	set_hl("BufferLineCloseButtonSelected", { fg = C.red, bg = C.blue })
	set_hl("BufferLineCloseButtonVisible", { fg = C.fg_dark, bg = C.bg_dark })
	set_hl("BufferLineModified", { fg = C.yellow, bg = C.bg_dark })
	set_hl("BufferLineModifiedSelected", { fg = C.yellow, bg = C.blue })
	set_hl("BufferLineModifiedVisible", { fg = C.yellow, bg = C.bg_dark })
	set_hl("BufferLineTabSeparator", { fg = C.bg_dark, bg = C.bg_dark })
	set_hl("BufferLineTabSeparatorSelected", { fg = C.blue, bg = C.blue })
	set_hl("BufferLineTabSeparatorVisible", { fg = C.bg_dark, bg = C.bg_dark })

	-- WhichKey
	set_hl("WhichKey", { fg = C.cyan })
	set_hl("WhichKeyDesc", { fg = C.fg })
	set_hl("WhichKeyGroup", { fg = C.blue })
	set_hl("WhichKeySeparator", { fg = C.nord3 })
	set_hl("WhichKeyFloat", { bg = float_actual_bg })
	set_hl("WhichKeyBorder", { fg = C.nord3, bg = float_actual_bg })

	-- Indent Blankline
	set_hl("IndentBlanklineChar", { fg = C.nord2 })
	set_hl("IndentBlanklineSpaceChar", { fg = C.nord2 })
	set_hl("IndentBlanklineContextChar", { fg = C.blue, nocombine = true })
	set_hl("IblScope", { link = "IndentBlanklineContextChar" })

	-- Gitsigns
	local gs_add_fg = config.plugin_customization.gitsigns.add or C.green
	local gs_change_fg = config.plugin_customization.gitsigns.change or C.blue
	local gs_delete_fg = config.plugin_customization.gitsigns.delete or C.red
	set_hl("GitSignsAdd", { fg = gs_add_fg })
	set_hl("GitSignsChange", { fg = gs_change_fg })
	set_hl("GitSignsDelete", { fg = gs_delete_fg })
	set_hl("GitSignsAddLn", { bg = gs_add_fg .. "1A" })
	set_hl("GitSignsChangeLn", { bg = gs_change_fg .. "1A" })
	set_hl("GitSignsDeleteLn", { bg = gs_delete_fg .. "1A" })

	-- Noice
	set_hl("NoiceCmdlinePopup", { bg = float_actual_bg })
	set_hl("NoiceCmdlinePopupBorder", { fg = C.nord3, bg = float_actual_bg })
	set_hl("NoiceConfirm", { bg = float_actual_bg, fg = C.green })
	set_hl("NoiceConfirmBorder", { fg = C.green, bg = float_actual_bg })
	set_hl("NoicePopup", { bg = float_actual_bg })
	set_hl("NoicePopupBorder", { fg = C.nord3, bg = float_actual_bg })
	set_hl("NoiceMini", { fg = C.fg_alt, bg = C.bg_light })

	-- NvimNotify
	set_hl("NotifyERRORBorder", { fg = C.red })
	set_hl("NotifyWARNBorder", { fg = C.orange })
	set_hl("NotifyINFOBorder", { fg = C.cyan })
	set_hl("NotifyDEBUGBorder", { fg = C.nord3 })
	set_hl("NotifyTRACEBorder", { fg = C.magenta })
	set_hl("NotifyERRORTitle", { fg = C.red, bold = true })
	set_hl("NotifyWARNTitle", { fg = C.orange, bold = true })
	set_hl("NotifyINFOTitle", { fg = C.cyan, bold = true })
	set_hl("NotifyDEBUGTitle", { fg = C.nord3, bold = true })
	set_hl("NotifyTRACETitle", { fg = C.magenta, bold = true })
	set_hl("NotifyERRORIcon", { fg = C.red })
	set_hl("NotifyWARNIcon", { fg = C.orange })
	set_hl("NotifyINFOIcon", { fg = C.cyan })
	set_hl("NotifyDEBUGIcon", { fg = C.nord3 })
	set_hl("NotifyTRACEIcon", { fg = C.magenta })
	set_hl("NotifyBody", { fg = C.fg })

	-- Alpha (Màn hình khởi động)
	set_hl("AlphaHeader", { fg = C.blue, bold = true })
	set_hl("AlphaButtons", { fg = C.cyan })
	set_hl("AlphaShortcut", { fg = C.magenta })
	set_hl("AlphaFooter", { fg = C.fg_dark, italic = true })

	-- Illuminate (highlight word under cursor)
	set_hl("IlluminatedWordText", { bg = C.bg_light })
	set_hl("IlluminatedWordRead", { bg = C.bg_light })
	set_hl("IlluminatedWordWrite", { bg = C.bg_light, bold = true })
end

return M
