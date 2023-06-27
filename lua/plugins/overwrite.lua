return {
	{ "rcarriga/nvim-notify", enabled = false },
	{
		"hrsh7th/nvim-cmp",
		opts = function(_, opts)
			local cmp = require("cmp")

			opts.mapping = vim.tbl_extend("force", opts.mapping, {
				["<Tab>"] = cmp.mapping.confirm({ select = true }),
				["<CR>"] = cmp.mapping.confirm({
					behavior = cmp.ConfirmBehavior.Replace,
					select = true,
				}),
			})
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		init = function()
			require("nvim-treesitter.install").prefer_git = true
		end,
		keys = {
			{ "<c-w>", desc = "Increment selection" },
			{ "<bs>", desc = "Decrement selection", mode = "x" },
		},
		opts = {
			incremental_selection = {
				keymaps = {
					init_selection = "<c-w>",
					node_incremental = "<c-w>",
					scope_incremental = false,
					node_decremental = "<bs>",
				},
			},
		},
	},
}
