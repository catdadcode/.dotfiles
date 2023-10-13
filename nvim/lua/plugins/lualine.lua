return {
	"nvim-lualine/lualine.nvim",
	opts = {
		winbar = {
			lualine_y = { { "filename", path = 1 } },
			-- lualine_x = { "filetype" },
		},
		inactive_winbar = {
			lualine_x = { { "filename", path = 1 } },
			-- lualine_x = { "filetype" },
		},
	},
}
