local M = {}

local function set_hl(group, opts)
	local success, err = pcall(vim.api.nvim_set_hl, 0, group, opts)
	if not success then
		-- vim.notify("Error setting highlight for " .. group .. ": " .. tostring(err), vim.log.levels.WARN)
	end
end

function M.apply(C, config)
	set_hl("Normal", { fg = C.fg, bg = C.bg })
	set_hl("EndOfBuffer", { fg = C.bg_dark, bg = C.bg })
	set_hl("NonText", { fg = C.nord3, bg = C.bg })
	set_hl("Whitespace", { fg = C.nord1, bg = C.bg })

	set_hl("Cursor", { fg = C.bg, bg = C.fg })
	set_hl("CursorLine", { bg = C.bg_cursorline })
	set_hl("CursorColumn", { bg = C.bg_cursorline })
	set_hl("ColorColumn", { bg = C.bg_cursorline })

	set_hl("LineNr", { fg = C.fg_gutter, bg = C.bg })
	set_hl("CursorLineNr", { fg = C.nord5, bg = C.bg_cursorline, bold = true })
	set_hl("SignColumn", { fg = C.fg_gutter, bg = C.bg })

	set_hl("Visual", { bg = C.bg_visual })
	set_hl("VisualNOS", { link = "Visual" })

	set_hl("Search", { fg = C.bg, bg = C.bg_search_result, bold = true })
	set_hl("IncSearch", { fg = C.bg, bg = C.orange, bold = true })
	set_hl("Substitute", { fg = C.bg, bg = C.green, bold = true })

	set_hl("Pmenu", { fg = C.fg_alt, bg = C.bg_dark })
	set_hl("PmenuSel", { fg = C.nord6, bg = C.nord10, bold = true })
	set_hl("PmenuSbar", { bg = C.nord1 })
	set_hl("PmenuThumb", { bg = C.nord3 })

	set_hl("Folded", { fg = C.comment, bg = C.bg_dark, italic = config.italic_comments })
	set_hl("FoldColumn", { fg = C.fg_gutter, bg = C.bg })

	set_hl("DiffAdd", { fg = C.green, bg = C.bg_dark })
	set_hl("DiffChange", { fg = C.blue, bg = C.bg_dark })
	set_hl("DiffDelete", { fg = C.red, bg = C.bg_dark, bold = true })
	set_hl("DiffText", { fg = C.fg, bg = C.nord10, bold = true })

	set_hl("ErrorMsg", { fg = C.red, bg = C.bg, bold = true })
	set_hl("WarningMsg", { fg = C.yellow, bg = C.bg, bold = true })
	set_hl("MoreMsg", { fg = C.green, bold = true })
	set_hl("ModeMsg", { fg = C.fg, bold = true })
	set_hl("Question", { fg = C.cyan, bold = true })
	set_hl("SpellBad", { undercurl = config.underline_errors, sp = C.red })
	set_hl("SpellCap", { undercurl = config.underline_errors, sp = C.yellow })
	set_hl("SpellLocal", { undercurl = config.underline_errors, sp = C.cyan })
	set_hl("SpellRare", { undercurl = config.underline_errors, sp = C.magenta })

	set_hl("TabLine", { fg = C.fg_dark, bg = C.bg_dark })
	set_hl("TabLineSel", { fg = C.nord6, bg = C.nord9, bold = true })
	set_hl("TabLineFill", { bg = C.bg_dark })

	set_hl("Directory", { fg = C.blue, bold = true })
	set_hl("Title", { fg = C.magenta, bold = config.bold_functions })
	set_hl("Conceal", { fg = C.fg_dark, bg = C.bg })
	set_hl("SpecialKey", { fg = C.nord3 })

	local keyword_style = {}
	if config.italic_keywords then
		keyword_style.italic = true
	end
	if config.bold_keywords then
		keyword_style.bold = true
	end

	local comment_style = {}
	if config.italic_comments then
		comment_style.italic = true
	end

	local func_style = {}
	if config.italic_functions then
		func_style.italic = true
	end
	if config.bold_functions then
		func_style.bold = true
	end

	local var_fg = config.colored_variables and C.fg_alt or C.fg
	local var_style = {}
	if config.italic_variables then
		var_style.italic = true
	end

	set_hl("@comment", { fg = C.comment, gui = comment_style })
	set_hl("@error", { fg = C.red, bold = true })
	set_hl("@punctuation.delimiter", { fg = C.nord3 })
	set_hl("@punctuation.bracket", { fg = C.nord3 })
	set_hl("@punctuation.special", { fg = C.magenta })
	set_hl("@constant", { fg = C.cyan })
	set_hl("@constant.builtin", { fg = C.cyan, italic = true, bold = true })
	set_hl("@constant.macro", { fg = C.magenta })
	set_hl("@string", { fg = C.green })
	set_hl("@string.regex", { fg = C.orange })
	set_hl("@string.escape", { fg = C.magenta })
	set_hl("@character", { fg = C.green })
	set_hl("@character.special", { fg = C.magenta })
	set_hl("@boolean", { fg = C.cyan, bold = true })
	set_hl("@number", { fg = C.cyan })
	set_hl("@float", { fg = C.cyan })
	set_hl("@function", { fg = C.blue, gui = func_style })
	set_hl("@function.builtin", { fg = C.blue, italic = true, bold = true })
	set_hl("@function.macro", { fg = C.magenta })
	set_hl("@function.call", { fg = C.blue })
	set_hl("@method", { link = "@function" })
	set_hl("@method.call", { link = "@function.call" })
	set_hl("@constructor", { fg = C.cyan, bold = true })
	set_hl("@parameter", { fg = var_fg, gui = var_style })
	set_hl("@keyword", { fg = C.magenta, gui = keyword_style })
	set_hl("@keyword.function", { fg = C.magenta, italic = true })
	set_hl("@keyword.operator", { fg = C.magenta })
	set_hl("@keyword.return", { fg = C.magenta, bold = true })
	set_hl("@operator", { fg = C.fg })
	set_hl("@type", { fg = C.cyan })
	set_hl("@type.builtin", { fg = C.cyan, italic = true })
	set_hl("@type.definition", { fg = C.nord5, bold = true })
	set_hl("@storageclass", { fg = C.magenta, italic = true })
	set_hl("@namespace", { fg = C.nord5 })
	set_hl("@include", { fg = C.blue, bold = true })
	set_hl("@preproc", { fg = C.yellow })
	set_hl("@variable", { fg = var_fg, gui = var_style })
	set_hl("@variable.builtin", { fg = C.cyan, italic = true, bold = true })
	set_hl("@field", { fg = C.nord4 })
	set_hl("@property", { link = "@field" })
	set_hl("@label", { fg = C.blue, bold = true })
	set_hl("@tag", { fg = C.red })
	set_hl("@tag.attribute", { fg = C.cyan, italic = config.italic_keywords })
	set_hl("@tag.delimiter", { fg = C.nord3 })
	set_hl("@text", { fg = C.fg })
	set_hl("@text.strong", { bold = true })
	set_hl("@text.emphasis", { italic = true })
	set_hl("@text.underline", { underline = true })
	set_hl("@text.strike", { strikethrough = true })
	set_hl("@text.title", { fg = C.blue, bold = true })
	set_hl("@text.literal", { fg = C.green })
	set_hl("@text.uri", { fg = C.green, underline = true })

	set_hl("Comment", { link = "@comment" })
	set_hl("Constant", { link = "@constant" })
	set_hl("String", { link = "@string" })
	set_hl("Character", { link = "@character" })
	set_hl("Number", { link = "@number" })
	set_hl("Boolean", { link = "@boolean" })
	set_hl("Float", { link = "@float" })
	set_hl("Function", { link = "@function" })
	set_hl("Operator", { link = "@operator" })
	set_hl("Keyword", { link = "@keyword" })
	set_hl("Conditional", { link = "@keyword" })
	set_hl("Repeat", { link = "@keyword" })
	set_hl("Statement", { link = "@keyword" })
	set_hl("Type", { link = "@type" })
	set_hl("StorageClass", { link = "@storageclass" })
	set_hl("Structure", { link = "@type.definition" })
	set_hl("Identifier", { fg = config.colored_variables and C.nord5 or C.fg })
	set_hl("PreProc", { link = "@preproc" })
	set_hl("Special", { fg = C.magenta })
	set_hl("Underlined", { underline = true })
	set_hl("Todo", { fg = C.bg, bg = C.yellow, bold = true })

	local diag_underline_gui_val = config.underline_errors and "undercurl" or C.none
	set_hl("DiagnosticError", { fg = C.red })
	set_hl("DiagnosticWarn", { fg = C.yellow })
	set_hl("DiagnosticInfo", { fg = C.cyan })
	set_hl("DiagnosticHint", { fg = C.green })
	set_hl("LspDiagnosticsDefaultError", { link = "DiagnosticError" })
	set_hl("LspDiagnosticsDefaultWarning", { link = "DiagnosticWarn" })
	set_hl("LspDiagnosticsDefaultInformation", { link = "DiagnosticInfo" })
	set_hl("LspDiagnosticsDefaultHint", { link = "DiagnosticHint" })
	set_hl("LspDiagnosticsUnderlineError", { gui = diag_underline_gui_val, sp = C.red })
	set_hl("LspDiagnosticsUnderlineWarning", { gui = diag_underline_gui_val, sp = C.yellow })
	set_hl("LspDiagnosticsUnderlineInformation", { gui = diag_underline_gui_val, sp = C.cyan })
	set_hl("LspDiagnosticsUnderlineHint", { gui = diag_underline_gui_val, sp = C.green })
end

return M
