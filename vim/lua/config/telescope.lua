local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return
end

-- telescope.load_extension('live_grep_args')
telescope.setup {
  pickers = {
    find_files = {
      -- `hidden = true` will still show the inside of `.git/` as it's not `.gitignore`d.
      find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
    },
  },
}

vim.keymap.set('n', '<leader>ff', [[:Telescope find_files<CR>]], {})
vim.keymap.set('n', '<leader>fg', [[:Telescope live_grep<CR>]], {})
vim.keymap.set('n', '<leader>fb', [[:Telescope buffers<CR>]], {})
vim.keymap.set('n', '<leader>fh', [[:Telescope help_tags<CR>]], {})
