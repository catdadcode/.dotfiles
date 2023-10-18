return {
	"nvim-lualine/lualine.nvim",
	opts = {
		options = {
			disabled_filetypes = {
				"lazyterm",
				"dashboard",
			},
		},
		sections = {
			lualine_z = {
				{ "datetime", style = "%I:%M:%S %p" },
			},
		},
		winbar = {
			lualine_b = {
				{ "filename", path = 1 },
			},
			lualine_c = {
				{ "filetype" },
			},
		},
		inactive_winbar = {
			lualine_c = {
				{ "filename", path = 1 },
				{ "filetype" },
			},
		},
	},
}
