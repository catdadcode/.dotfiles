return {
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		ft = { "markdown" },
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
	},
	{
		"ellisonleao/glow.nvim",
		config = true,
		cmd = "Glow",
		opts = {
			border = "shadow",
			style = "dark",
			width = vim.o.columns,
			height = vim.o.lines,
			width_ratio = 0.5,
			height_ratio = 1,
		},
	},
}
