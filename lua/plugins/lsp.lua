return {
	{
		"neovim/nvim-lspconfig",
		opts = {
			autoformat = false,
			servers = {
				clangd = {
					cmd = {
						"clangd",
						"-j=24",
						"--background-index",
						"--clang-tidy",
						"--limit-references=0",
						"--all-scopes-completion",
						"--completion-style=detailed",
						"--clang-tidy-checks=performance-*,bugprone-*",
						"--header-insertion=iwyu",
						"--pch-storage=memory",
					},
				},
			},
		},
		init = function()
			local keys = require("lazyvim.plugins.lsp.keymaps").get()
			keys[#keys + 1] = { "K", false }
			keys[#keys + 1] = { "gK", false }
			-- add a keymap
			keys[#keys + 1] = { "<c-q>", vim.lsp.buf.hover, mode = { "n", "i" }, desc = "Hover" }
		end,
	},
}
