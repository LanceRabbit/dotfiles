-- configure general vim settings
local opt = vim.opt
local g = vim.g

-- support syntax highlighting
vim.cmd 'syntax enable'
-- try to recognize filetypes and load rel' plugins
vim.cmd 'filetype plugin indent on'

-- Set <space> as the leader key
-- Note: nvim-lspconf has been taken <space> as function key
g.mapleader = ' '

-- Turn off compatible with vi.
opt.compatible = false              -- set nocompatible

-- set number
opt.ruler = true                    -- Show cursor position.
opt.relativenumber = true           -- set number relativenumber
opt.autoindent = true               -- autoindent on return/enter

-- tab and space
local indent = 2
opt.tabstop = indent                -- Softtabs or die! use 2 spaces for tabs.
opt.shiftwidth = indent             -- Number of spaces to use for each step of (auto)indent.
opt.softtabstop = indent
opt.showtabline = indent
opt.expandtab = true                --  Use the spaces to insert a <Tab>
opt.shiftround = true               -- Round indent to multiple of 'shiftwidth'
opt.smartindent = true

-- [tab] new / vnew windows location
opt.splitbelow = true
opt.splitright = true

-- search
opt.hlsearch = true                -- highlighting the seacrh word
opt.smartcase = true               -- use case sensitive if capital letter present or \C
opt.ignorecase = true              -- ignore case in searches
opt.incsearch = true               -- do incremental searching
opt.magic = true                   -- Use 'magic' patterns (extended regular expressions).

opt.wrap = true
opt.linebreak = true

-- should make scrolling faster
opt.ttyfast = true
opt.lazyredraw = true

opt.cursorline = true
opt.scrolloff = 5                 -- show more

opt.backspace = 'indent,eol,start'  -- Backspace deletes like most programs in insert mode
opt.showcmd = true                  -- display incomplete commands
opt.showmode = false                -- don't show mode as airline already does
opt.swapfile = true

-- clopboard
opt.clipboard:append("unnamedplus")

-- Set colorscheme
vim.o.termguicolors = true
vim.cmd [[colorscheme hybrid]]

-- FIX

-- fixed ctags not working on Neovim
-- ref: https://github.com/neovim/neovim/issues/17463
-- opt.tags = vim.o.tags .. ',' .. vim.fn.expand('~') .. '/tags/global-tags'
opt.tags:append('tags')

-- fix snipMate waring
-- g.snipMate = { 'snippet_version': 1 }
