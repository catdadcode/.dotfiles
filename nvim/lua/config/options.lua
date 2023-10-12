-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.opt.winbar = "%=%m %f"
vim.opt.expandtab = false
vim.opt.formatoptions:remove({ "r", "o" })
vim.opt.tabstop = 3
vim.opt.shiftwidth = 3
vim.wo.relativenumber = false
