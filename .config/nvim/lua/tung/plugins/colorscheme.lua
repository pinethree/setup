-- return {
-- 	"ellisonleao/gruvbox.nvim",
-- 	priority = 1000,
-- 	config = function()
-- 		require("gruvbox").setup({
-- 			terminal_colors = true, -- add neovim terminal colors
-- 			undercurl = true,
-- 			underline = true,
-- 			bold = true,
-- 			italic = {
-- 				strings = false,
-- 				emphasis = true,
-- 				comments = false,
-- 				operators = false,
-- 				folds = true,
-- 			},
-- 			strikethrough = true,
-- 			invert_selection = false,
-- 			invert_signs = false,
-- 			invert_tabline = false,
-- 			invert_intend_guides = false,
-- 			inverse = true, -- invert background for search, diffs, statuslines and errors
-- 			contrast = "soft", -- can be "hard", "soft" or empty string
-- 			palette_overrides = {},
-- 			overrides = {},
-- 			dim_inactive = false,
-- 			transparent_mode = true,
-- 		})
--
-- 		vim.cmd.colorscheme("gruvbox")
-- 	end,
-- }

return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	config = function()
		require("catppuccin").setup({
			no_italic = true,
			no_underline = true,
			show_end_of_buffer = true,
		})

		vim.cmd.colorscheme("catppuccin")
	end,
}
