return {
	-- Install various themes.
	{
		"folke/tokyonight.nvim",
		opts = {
			style = "moon",
		},
	},
	{
		"ellisonleao/gruvbox.nvim",
		opts = {
			contrast = "hard",
		},
	},
	{ "luisiacc/the-matrix.nvim" },
	{ "iruzo/matrix-nvim" },
	{ "fcpg/vim-farout" },
	{ "nikolvs/vim-sunbather" },
	{
		"lalitmee/cobalt2.nvim",
		dependencies = { "tjdevries/colorbuddy.nvim" },
		init = function()
			require("colorbuddy").colorscheme("cobalt2")
		end,
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		opts = {
			color_overrides = {
				mocha = {
					text = "#F4CDE9",
					subtext1 = "#DEBAD4",
					subtext0 = "#C8A6BE",
					overlay2 = "#B293A8",
					overlay1 = "#9C7F92",
					overlay0 = "#866C7D",
					surface2 = "#705867",
					surface1 = "#5A4551",
					surface0 = "#44313B",

					base = "#352939",
					mantle = "#211924",
					crust = "#1a1016",
				},
			},
		},
	},

	-- Configure LazyVim to load gruvbox.
	{
		"LazyVim/LazyVim",
		opts = {
			colorscheme = "gruvbox",
		},
	},
}
