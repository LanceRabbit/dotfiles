-- Memo:
-- `y + i + ' or "`: 複製  `''` or `""` 內的文字
-- `vi + '`:  選擇 `'abcde'` quotes 內的文字

-- cstt -> change html tag -> vim-surround
-- cit -> change content inside of html tag

-- ~: string convert to upper or lower case
-- U: string convert to upper case
-- u: string convert to lower case

-- TODO: keymap function

local opts = { noremap = true, silent = true }

-- just a test
-- function _G.smart_tab()
--     return vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
-- end
-- vim.keymap.set('n', 'spath', [[:echo v:lua.smart_tab()<CR>]])

-- save file
vim.keymap.set("n", "<Leader>w", [[:write<CR>]])
-- exit without save
-- barbar.lua 設定 <Leader>x 會關閉 buffer
-- vim.keymap.set("n", "<Leader>x", [[:exit<CR>]], opts)
vim.keymap.set("n", "<Leader>t", [[:exit<CR>]], opts)
-- vim.keymap.set('n', '<Leader>e', '<C-W>q<CR>')
vim.keymap.set("n", "<Leader>qa", [[:qall!<CR>]], opts)

-- Git blame
vim.keymap.set("n", "<Leader>b", [[<Cmd>Git blame<CR>]])

-- jump on tab
-- barbar.lua 設定 會跳到前後的 buffer
-- vim.keymap.set("n", "<S-l>", [[:tabn<CR>]], opts)
-- vim.keymap.set("n", "<S-h>", [[:tabp<CR>]], opts)

-- tab
vim.keymap.set("n", "nt", [[:tabe<CR>]], opts)
vim.keymap.set("n", "nv", [[:vnew<CR>]], opts)
vim.keymap.set("n", "nh", [[:new<CR>]], opts)

-- jump on windows
vim.keymap.set("n", "wh", [[<C-w>h]], opts)
vim.keymap.set("n", "wj", [[<C-w>j]], opts)
vim.keymap.set("n", "wk", [[<C-w>k]], opts)
vim.keymap.set("n", "wl", [[<C-w>l]], opts)

-- buffer
-- clear all buffer
vim.keymap.set("n", "qff", [[:%bdelete<CR>]], opts)

-- clear search
vim.keymap.set("n", "<C-c>", [[:noh<CR>]], opts)

-- jump to the end of line
vim.keymap.set("n", "s]", [[<S-$>]], opts)
-- jump to the head of line
vim.keymap.set("n", "s[", [[<S-^>]], opts)

-- copy all line
vim.keymap.set("n", "cal", [[gg"*yG<CR>]])
-- copy file path
vim.keymap.set("n", "caf", [[:!echo -n % | pbcopy<CR>]])

-- add quote
vim.keymap.set("n", "qs", [[normal mpea'<ESC>bi'<ESC>`pl]], opts)
vim.keymap.set("n", "qd", [[normal mpea"<ESC>bi"<ESC>`pl]], opts)
vim.keymap.set("v", "''", [[<ESC>`>a'<ESC>`<i'<ESC>]])
vim.keymap.set("v", '""', [[<ESC>`>a"<ESC>`<i"<ESC>]])

-- delete last character.
-- vim.keymap.set('v', 'dl', [[:norm $x<CR>]])
vim.keymap.set("v", "dl", [[:normal $x<CR>]])

-- move the current line of code to up or down
vim.keymap.set("n", "<S-U>", [[ddkkp]], opts)
vim.keymap.set("n", "<S-D>", [[ddp]], opts)

-- move the current line of code to up or down
vim.keymap.set("v", "<C-j>", ":m .+1<CR>==")
vim.keymap.set("v", "<C-k>", ":m .-2<CR>==")

-- move the block text to up or down
vim.keymap.set("v", "<S-U>", "dkPV`")
vim.keymap.set("v", "<S-D>", "dpV`")

-- NOTE: Enable  Option key as Meta Key,
-- Warp terminal:  Settings > Features > Keys > Left Option key
-- M: meta key | alt key
--
vim.keymap.set("n", "<M-h>", "<c-w>5<", opts)
vim.keymap.set("n", "<M-l>", "<c-w>5>", opts)
vim.keymap.set("n", "<M-j>", "<C-W>+", opts)
vim.keymap.set("n", "<M-k>", "<C-W>-", opts)
-- Resize with arrows
-- vim.keymap.set("n", "u2", ":resize -2<CR>", opts)
-- vim.keymap.set("n", "d2", ":resize +2<CR>", opts)
-- vim.keymap.set("n", "l2", ":vertical resize -2<CR>", opts)
-- vim.keymap.set("n", "r2", ":vertical resize +2<CR>", opts)

-- hidden text
-- vim.keymap.set('n', 'zf', [[zfip]], opts)

-- change to normal mode while insert mode
vim.keymap.set("i", "jj", [[<esc>]], opts)

-- select to the end of line
-- vim.keymap.set('v', '$', [[g_]], opts)
vim.keymap.set("n", "sb", [[vg_]], opts)

-- remove the method wrapped in method
-- example:
-- a_method(b_method("delete"))
-- move corsor to b_method, and use 'dws' that will remove the b_method()
vim.keymap.set("n", "dws", [[normal dt( \| ds(<CR<]], opts)
