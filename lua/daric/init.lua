local M = {}

M.config = {
	italic_comments = true,
	italic_keywords = true,
	italic_functions = false,
	italic_variables = false,
	bold_keywords = true,
	bold_functions = true,
	underline_errors = true,
	colored_variables = false,
	transparent_floats = false,
	float_blend = 10,
	plugin_customization = {
		gitsigns = { add = nil, change = nil, delete = nil },
	},
	override_palette = {},
	override_highlights = {},
}

function M.setup(user_config)
	user_config = user_config or {}
	local new_config = vim.deepcopy(M.config)

	for k, v in pairs(user_config) do
		if type(v) == "table" and type(new_config[k]) == "table" then
			new_config[k] = vim.tbl_deep_extend("force", new_config[k] or {}, v)
		else
			new_config[k] = v
		end
	end
	M.config = new_config
end

function M.load()
	if vim.g.colors_name == "daric" and not M.is_reloading then
		return
	end
	M.is_reloading = false -- Reset flag

	vim.cmd("hi clear")
	if vim.fn.exists("syntax_on") then
		vim.cmd("syntax reset")
	end

	vim.opt.termguicolors = true
	vim.o.background = "dark"

	local palette_module = require("daric.palette")
	local colors = vim.tbl_deep_extend("force", palette_module.colors, M.config.override_palette or {})

	require("daric.highlights").apply(colors, M.config)
	require("daric.integrations").apply(colors, M.config)

	if M.config.override_highlights then
		for group, hl_opts in pairs(M.config.override_highlights) do
			if type(hl_opts) == "table" then
				pcall(vim.api.nvim_set_hl, 0, group, hl_opts)
			end
		end
	end

	vim.g.colors_name = "daric"
	if vim.o.background == "dark" then
		vim.api.nvim_command("doautocmd User DaricThemeLoadedDark")
	else
		vim.api.nvim_command("doautocmd User DaricThemeLoadedLight")
	end
	vim.api.nvim_command("doautocmd ColorScheme daric")
end

-- Function to allow live reloading of the theme for development
function M.reload()
	M.is_reloading = true
	local persisted_config = vim.deepcopy(M.config) -- Persist current config options

	-- Clear Lua module cache for theme files
	package.loaded["daric.palette"] = nil
	package.loaded["daric.highlights"] = nil
	package.loaded["daric.integrations"] = nil
	package.loaded["daric"] = nil -- or package.loaded["daric.init"]

	-- Restore config before loading
	M.config = persisted_config
	M.load()
	vim.notify("🎨 Daric theme reloaded!", vim.log.levels.INFO, { title = "Daric Theme" })
end

return M
