return {
	"nvim-lualine/lualine.nvim",
	opts = {
		winbar = {
			lualine_b = { { "filename", path = 1 } },
			lualine_x = { "filetype" },
		},
		inactive_winbar = {
			lualine_b = { { "filename", path = 1 } },
			lualine_x = { "filetype" },
		},
	},
}
