local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return
end


local telescopeConfig = require("telescope.config")
-- Clone the default Telescope configuration
local vimgrep_arguments = { unpack(telescopeConfig.values.vimgrep_arguments) }

-- I want to search in hidden/dot files.
table.insert(vimgrep_arguments, "--hidden")
-- I don't want to search in the `.git` directory.
table.insert(vimgrep_arguments, "--glob")
table.insert(vimgrep_arguments, "!**/.git/*")

-- telescope.load_extension('live_grep_args')
telescope.setup {
  pickers = {
    defaults = {
      -- `hidden = true` is not supported in text grep commands.
      vimgrep_arguments = vimgrep_arguments,
    },
    find_files = {
      -- `hidden = true` will still show the inside of `.git/` as it's not `.gitignore`d.
      find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
    },
    live_grep = {
      -- `hidden = true` will still show the inside of `.git/` as it's not `.gitignore`d.
      find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
    },
  },
}

vim.keymap.set('n', '<leader>ff', [[:Telescope find_files<CR>]], {})
vim.keymap.set('n', '<leader>fgf', [[:Telescope git_files<CR>]], {})
vim.keymap.set('n', '<leader>fg', [[:Telescope live_grep<CR>]], {})
vim.keymap.set('n', '<leader>fb', [[:Telescope buffers<CR>]], {})
vim.keymap.set('n', '<leader>fh', [[:Telescope help_tags<CR>]], {})
