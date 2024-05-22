return {
	"stevearc/conform.nvim",
	-- optional = true,
	lazy = true,
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	keys = {
		{
			-- Customize or remove this keymap to your liking
			"<leader>f",
			function()
				require("conform").format({ async = true, lsp_fallback = true })
			end,
			mode = "",
			desc = "Format buffer",
		},
	},
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			go = { "goimports", "gofumpt", "golines" },
			js = { "prettierd" },
		},
		format_on_save = { timeout_ms = 500, lsp_fallback = true },
	},
}
