return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      style = "moon", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
    },
    config = function ()
      vim.cmd [[colorscheme tokyonight]]
    end
  }
}
