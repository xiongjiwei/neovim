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
					item.abbr = string.len(item.abbr) > 49 and string.sub(item.abbr, 1, 50) .. "..." or item.abbr
					return item
				end,
			},
		},
	},
}
