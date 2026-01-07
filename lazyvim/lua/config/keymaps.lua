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

-- 複製雙引號內的文字
vim.keymap.set("n", '<leader>cw"', 'vi"y', { desc = "copy words in double quotes" })
-- 複製單引號內的文字
vim.keymap.set("n", "<leader>cw'", "vi'y", { desc = "copy words in single quotes" })
-- 複製圓括號內的文字
vim.keymap.set("n", "<leader>cw(", "vi(y", { desc = "copy words in parentheses" })
-- 複製方括號內的文字
vim.keymap.set("n", "<leader>cw[", "vi[y", { desc = "copy words in square brackets" })
-- 複製大括號內的文字
vim.keymap.set("n", "<leader>cw{", "vi{y", { desc = "copy words in curly braces" })

-- 貼上並替換雙引號內的文字
vim.keymap.set("n", '<leader>pw"', 'vi"p', { desc = "paste in double quotes" })
-- 貼上並替換單引號內的文字
vim.keymap.set("n", "<leader>pw'", "vi'p", { desc = "paste in single quotes" })
-- 貼上並替換圓括號內的文字
vim.keymap.set("n", "<leader>pw(", "vi(p", { desc = "paste in parentheses" })
-- 貼上並替換方括號內的文字
vim.keymap.set("n", "<leader>pw[", "vi[p", { desc = "paste in square brackets" })
-- 貼上並替換大括號內的文字
vim.keymap.set("n", "<leader>pw{", "vi{p", { desc = "paste in curly braces" })

-- move the current line of code to up or down
vim.keymap.set("n", "<S-U>", [[ddkkp]], { desc = "upper current line" })
vim.keymap.set("n", "<S-D>", [[ddp]], { desc = "lower current line" })

-- jump to the end of line
vim.keymap.set("n", "j]", [[<S-$>]], { desc = "jump to the end of line" })
-- jump to the head of line
vim.keymap.set("n", "j[", [[<S-^>]], { desc = "jump to the head of line" })

vim.keymap.set("n", "gl", vim.diagnostic.open_float, { desc = "jump to diagnostic" }) -- show diagnostics for line
