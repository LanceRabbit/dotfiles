local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return
end

-- telescope.load_extension('live_grep_args')
telescope.setup{}

vim.keymap.set('n', '<leader>ff', [[:Telescope find_files<CR>]], {})
vim.keymap.set('n', '<leader>fg', [[:Telescope live_grep<CR>]], {})
vim.keymap.set('n', '<leader>fb', [[:Telescope buffers<CR>]], {})
vim.keymap.set('n', '<leader>fh', [[:Telescope help_tags<CR>]], {})
