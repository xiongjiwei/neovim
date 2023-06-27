return {
	{ "rcarriga/nvim-notify", enabled = false },
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
    {
        "ggandor/flit.nvim",
        enabled = false,
    },
}
