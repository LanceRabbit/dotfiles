-- REF: https://yasushisakai.com/neovim.html#org4d7fb2b

return {
  "folke/which-key.nvim",
  enabled = false,
  event = "VeryLazy",
  config = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
    require("which-key").setup({
      plugins = {
        marks = true, -- shows a list of your marks on ' and `
        registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
        -- the presets plugin, adds help for a bunch of default keybindings in Neovim
        -- No actual key bindings are created
        spelling = {
          enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
          suggestions = 20, -- how many suggestions should be shown in the list?
        },
        presets = {
          operators = true, -- adds help for operators like d, y, ...
          motions = true, -- adds help for motions
          text_objects = true, -- help for text objects triggered after entering an operator
          windows = true, -- default bindings on <c-w>
          nav = true, -- misc bindings to work with windows
          z = true, -- bindings for folds, spelling and others prefixed with z
          g = false, -- bindings for prefixed with g
        },
      },
     -- operators = { wk = "Comments" },
    })
    local wk = require("which-key")
    wk.register({
        l = {"<cmd>Lazy<cr>", "Lazy"},
        y = {'\'"+y', "Copy to Clipboard"},
        s = {'w', "Save"},
    }, { prefix = "<leader>" })
  end
}
