-- return {
-- "ellisonleao/gruvbox.nvim",
-- priority = 1000,
-- config = function()
-- 	require("gruvbox").setup({
-- 		terminal_colors = true, -- add neovim terminal colors
-- 		undercurl = true,
-- 		underline = true,
-- 		bold = false,
-- 		italic = {
-- 			strings = false,
-- 			emphasis = true,
-- 			comments = false,
-- 			operators = false,
-- 			folds = true,
-- 		},
-- 		strikethrough = true,
-- 		invert_selection = false,
-- 		invert_signs = false,
-- 		invert_tabline = false,
-- 		invert_intend_guides = false,
-- 		inverse = true, -- invert background for search, diffs, statuslines and errors
-- 		contrast = "hard", -- can be "hard", "soft" or empty string
-- 		palette_overrides = {},
-- 		overrides = {},
-- 		dim_inactive = false,
-- 		transparent_mode = false,
-- 	})
--
-- 	vim.cmd.colorscheme("gruvbox")
-- end,
-- }

-- return {
-- 	"olivercederborg/poimandres.nvim",
-- 	lazy = false,
-- 	priority = 1000,
-- 	config = function()
-- 		require("poimandres").setup({
-- 			-- leave this setup function empty for default config
-- 			-- or refer to the configuration section
-- 			-- for configuration options
-- 			disable_italics = true,
-- 			disable_float_background = true,
-- 			disable_background = true,
-- 			bold_vert_split = true,
-- 		})
--
-- 		vim.cmd.colorscheme("poimandres")
-- 	end,
--
-- 	-- optionally set the colorscheme within lazy config
-- 	-- vim.cmd("colorscheme poimandres"),
-- }

return {
	"Verf/deepwhite.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		require("deepwhite").setup({
			low_blue_light = true,
		})

		vim.cmd([[colorscheme deepwhite]])
	end,
}
