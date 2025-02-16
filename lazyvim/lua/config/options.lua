-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- configure general vim settings
local opt = vim.opt
local g = vim.g

g.rails_ctags_arguments = [['--languages=ruby --exclude=.git --exclude=log .']]

-- FIX

-- fixed ctags not working on Neovim
-- ref: https://github.com/neovim/neovim/issues/17463
-- opt.tags = vim.o.tags .. ',' .. vim.fn.expand('~') .. '/tags/global-tags'
opt.tags:append("./tags")
