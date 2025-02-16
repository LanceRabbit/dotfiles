-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- copy all line
vim.keymap.set("n", "<leader>al", [[gg"*yG<CR>]])
-- copy file path
vim.keymap.set("n", "<leader>tf", [[:!echo -n % | pbcopy<CR>]])
