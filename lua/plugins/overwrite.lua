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
		"LazyVim/LazyVim",
		opts = {
			colorscheme = "catppuccin",
		},
	},
	{
		"nvim-lualine/lualine.nvim",
		opts = function(_, opts)
			local Util = require("lazyvim.util")
			local function updates()
				local up = require("lazy.status").updates()
                return up and "󱖗" .. string.sub(up, 4)
			end
			opts.sections.lualine_c[3].symbols = { modified = "  ", readonly = "", unnamed = "" }
			opts.sections.lualine_x[4] = {
                updates,
				cond = require("lazy.status").has_updates,
				color = Util.fg("Special"),
			}
		end,
	},
	{
		"nvim-neo-tree/neo-tree.nvim",
		enabled = false,
	},
}
