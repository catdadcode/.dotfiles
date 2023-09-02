-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- vim.opt.winbar = "%=%m %f"
vim.opt.expandtab = false
vim.opt.tabstop = 3
vim.opt.shiftwidth = 3

if vim.g.neovide then
	-- Enable this to see framerate.
	-- vim.g.neovide_profiler = true

	-- vim.g.neovide_fullscreen = true
	vim.o.guifont = "Cartograph CF:b,Noto Color Emoji:b"
	vim.opt.linespace = -9
	vim.g.neovide_cursor_vfx_mode = "railgun"
	vim.g.neovide_refresh_rate = 120
	vim.g.neovide_cursor_antialiasing = true
	vim.g.neovide_scroll_animation_length = 0.3
	vim.g.neovide_cursor_animation_length = 0.075
	vim.g.neovide_hide_mouse_when_typing = true
	vim.g.neovide_cursor_animate_command_line = true
	vim.wo.relativenumber = false
	vim.g.neovide_floating_blur_amount_x = 2.0
	vim.g.neovide_floating_blur_amount_y = 2.0

	-- Transparency stuff
	-- local alpha = function()
	-- 	return string.format("%x", math.floor(255 * (vim.g.transparency or 0.8)))
	-- end
	-- g:neovide_transparency should be 0 if you want to unify transparency of content and title bar.
	-- vim.g.neovide_transparency = 0.8
	-- vim.g.transparency = 0.8
	-- vim.g.neovide_background_color = "#0f1117" .. alpha()
end
