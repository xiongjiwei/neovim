return {
	{
		"nvim-lualine/lualine.nvim",
		opts = function(_, opts)
			opts.options.disabled_filetypes.winbar = { "dashboard", "alpha" }
			local Util = require("lazyvim.util")
			local function updates()
				local up = require("lazy.status").updates()
				return up and "󱖗" .. string.sub(up, 4)
			end
			opts.sections.lualine_c[2] = nil
			opts.sections.lualine_c[3] = nil
			opts.sections.lualine_c[4] = nil
			opts.sections.lualine_x[4] = {
				updates,
				cond = require("lazy.status").has_updates,
				color = Util.fg("Special"),
			}
			opts.sections.lualine_z = nil

			opts.winbar = {
				lualine_a = {
					{ "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
					{ "filename", path = 1, symbols = { modified = "  ", readonly = "", unnamed = "" } },
					{
						function()
							return require("nvim-navic").get_location()
						end,
						cond = function()
							return package.loaded["nvim-navic"] and require("nvim-navic").is_available()
						end,
					},
				},
				lualine_z = {
					function()
						return " " .. os.date("%R")
					end,
				},
			}
			opts.inactive_winbar = {
				lualine_a = {
					{ "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
					{ "filename", path = 1, symbols = { modified = "  ", readonly = "", unnamed = "" } },
				},
				lualine_z = {
					function()
						return " " .. os.date("%R")
					end,
				},
			}
			opts.extensions[#opts.extensions + 1] = "nvim-tree"
		end,
	},
}
