-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
-- S-h => 顯示所有隱藏檔案
-- ~: string convert to upper or lower case
-- U: string convert to upper case
-- u: string convert to lower case

-- Remove value in []
-- di + [

-- copy all line
vim.keymap.set("n", "<leader>al", [[gg"*yG<CR>]], { desc = "copy all line" })
-- copy file path
vim.keymap.set("n", "<leader>tf", [[:!echo -n % | pbcopy<CR>]], { desc = "copy current file path" })

-- move the current line of code to up or down
vim.keymap.set("n", "<S-U>", [[ddkkp]], { desc = "upper current line" })
vim.keymap.set("n", "<S-D>", [[ddp]], { desc = "lower current line" })

-- jump to the end of line
vim.keymap.set("n", "j]", [[<S-$>]], { desc = "jump to the end of line" })
-- jump to the head of line
vim.keymap.set("n", "j[", [[<S-^>]], { desc = "jump to the head of line" })

vim.keymap.set("n", "gl", vim.diagnostic.open_float, { desc = "jump to diagnostic" }) -- show diagnostics for line
