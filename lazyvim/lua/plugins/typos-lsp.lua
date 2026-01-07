return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        typos_lsp = {
          filetypes = {
            "lua",
            "ruby",
            "python",
            "javascript",
            "typescript",
            "html",
            "css",
            "json",
            "yaml",
            "markdown",
            "gitcommit",
          },
          init_options = {
            -- 指定設定檔路徑
            --~/.dotfiles/my_dictionary/custom_dict.txt
            config = vim.fn.expand("~/.dotfiles/typos/typos.toml"),
            diagnosticSeverity = "Warning",
          },
        },
      },
    },
  },
}

-- return {
--   {
--     "neovim/nvim-lspconfig",
--     opts = {
--       vim.lsp.enable("cspell_ls"),
--       vim.lsp.config("cspell_ls", {
--         cmd = { "cspell-lsp", "--stdio" },
--         filetypes = {
--           "lua",
--           "ruby",
--           "python",
--           "javascript",
--           "typescript",
--           "html",
--           "css",
--           "json",
--           "yaml",
--           "markdown",
--           "gitcommit",
--         },
--         init_options = {
--           -- cspell 特定設定
--           customDictionaries = {
--             custom = {
--               name = "custom",
--               path = vim.fn.expand("~/.dotfiles/my_dictionary/custom_dict.txt"),
--               addWords = true,
--             },
--           },
--         },
--
--         root_markers = { ".git" },
--       }),
--     },
--   },
-- }
