return {
	{
		"hrsh7th/nvim-cmp",
		opts = {
			formatting = {
				format = function(_, item)
					local icons = require("lazyvim.config").icons.kinds
					if icons[item.kind] then
						item.kind = icons[item.kind] .. item.kind
					end
					item.abbr = string.sub(item.abbr, 1, 50) .. string.len(item.abbr) > 49 and "..."
					return item
				end,
			},
		},
	},
}
