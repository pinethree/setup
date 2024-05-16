return {
	"simondrake/gomodifytags",
	dependencies = { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
	opts = {
		transformation = "camelcase",
		skip_unexported = true,
		override = true,
		--options = { "json=omitempty" },
		parse = { enabled = true, seperator = "--" },
	},
	vim.keymap.set(
		"n",
		"<leader>Gt",
		"<cmd>lua require('gomodifytags').GoAddTags('json', {transformation = 'snakecase', skip_unexported = false})<CR>",
		{ desc = "Add JSON Tags" }
	),
}
