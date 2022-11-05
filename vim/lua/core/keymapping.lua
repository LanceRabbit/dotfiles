
-- TODO: keymap function
--

local opts = { noremap = true, silent = true }

-- save file
vim.keymap.set('n', '<Leader>w', [[:write<CR>]])
-- exit without save
vim.keymap.set('n', '<Leader>x', [[:exit<CR>]], opts)
-- vim.keymap.set('n', '<Leader>e', '<C-W>q<CR>')


-- Git blame
vim.keymap.set('n', '<Leader>b', [[<Cmd>Git blame<CR>]])

-- jump on tab
vim.keymap.set('n', '<S-l>', [[:tabn<CR>]], opts)
vim.keymap.set('n', '<S-h>', [[:tabp<CR>]], opts)
-- tab
vim.keymap.set('n', 'nt', [[:tabe<CR>]], opts)
vim.keymap.set('n', 'vn', [[:vnew<CR>]], opts)
vim.keymap.set('n', 'hn', [[:new<CR>]], opts)

-- jump on windows
vim.keymap.set('n', 'wh', [[<C-w>h]], opts)
vim.keymap.set('n', 'wj', [[<C-w>j]], opts)
vim.keymap.set('n', 'wk', [[<C-w>k]], opts)
vim.keymap.set('n', 'wl', [[<C-w>l]], opts)

-- buffer
-- clear all buffer
vim.keymap.set('n', 'qff', [[:%bdelete<CR>]], opts)

-- clear search
vim.keymap.set('n', '<C-c>', [[:noh<CR>]], opts)

-- jump to the end of line
vim.keymap.set('n', 's]', [[<S-$>]], opts)
-- jump to the head of line
vim.keymap.set('n', 's[', [[<S-^>]], opts)

-- copy all line
vim.keymap.set('n', 'cal', [[gg"*yG<CR>]])

-- add quote
vim.keymap.set('n', 'qs', [[normal mpea'<ESC>bi'<ESC>`pl]], opts)
vim.keymap.set('n', 'qd', [[normal mpea"<ESC>bi"<ESC>`pl]], opts)
vim.keymap.set('v', '\'\'', [[<ESC>`>a'<ESC>`<i'<ESC>]])
vim.keymap.set('v', '\"\"', [[<ESC>`>a"<ESC>`<i"<ESC>]])

-- move the current line of code to up or down
vim.keymap.set('n', '<S-U>', [[ddkkp]], opts)
vim.keymap.set('n', '<S-D>', [[ddp]], opts)

-- hidden text
vim.keymap.set('n', 'zf', [[zfip]], opts)

-- change to normal mode while insert mode
vim.keymap.set('i', 'jj', [[<esc>]], opts)

-- select to the end of line
-- vim.keymap.set('v', '$', [[g_]], opts)
vim.keymap.set('n', 'sb', [[vg_]], opts)


-- remove the method wrapped in method
-- example:
-- a_method(b_method("delete"))
-- move corsor to b_method, and use 'dws' that will remove the b_method()
vim.keymap.set('n', 'dws', [[normal dt( \| ds(<CR<]], opts)

