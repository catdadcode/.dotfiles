-- return {
-- 	"wfxr/minimap.vim",
-- 	lazy = false,
-- 	-- cmd = { "Minimap", "MinimapClose", "MinimapToggle", "MinimapRefresh", "MinimapUpdateHightlight" },
-- 	init = function()
-- 		vim.cmd("let g:minimap_width = 10")
-- 		vim.cmd("let g:minimap_auto_start = 1")
-- 		vim.cmd("let g:minimap_auto_start_win_enter = 1")
-- 		vim.cmd("let g:minimap_close_filetypes = ['dashboard']")
-- 	end,
-- },
return {
	"petertriho/nvim-scrollbar",
	event = "BufReadPost",
	config = function()
		local scrollbar = require("scrollbar")
		-- local colors = require("tokyonight.colors").setup()
		scrollbar.setup({
			-- handle = { color = colors.bg_highlight },
			excluded_filetypes = { "prompt", "TelescopePrompt", "noice", "notify" },
			-- marks = {
			--   Search = { color = colors.orange },
			--   Error = { color = colors.error },
			--   Warn = { color = colors.warning },
			--   Info = { color = colors.info },
			--   Hint = { color = colors.hint },
			--   Misc = { color = colors.purple },
			-- },
		})
	end,
}
