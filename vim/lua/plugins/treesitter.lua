-- need to reinstall language server when upgrade neovim version.
-- example: TSInstall javascript
return {
  {
    "nvim-treesitter/nvim-treesitter-context",
    event = { "BufReadPost", "BufNewFile" },

    opts = { mode = "cursor" },
    enabled = true,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    version = false,
    cmd = { "TSUpdateSync" },
    -- options for nvim-treesitter. This will automatically call `require("nvim-treesitter").setup(opts)`
    opts = {
      ensure_installed = {
        "bash",
        "css",
        "graphql",
        "hcl",
        "javascript",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        "rust",
        "typescript",
        "tsx",
        "toml",
        "yaml"
      },
      matchup = { enable = true, },
      highlight = {
        enable = true, -- false will disable the whole extension
        disable = { "css" } -- list of language that will be disabled
      },
      autopairs = {
        enable = true,
      },
      indent = { enable = true, disable = { "python", "css" } },
      ignore_install = { "phpdoc" }, -- List of parsers to ignore installing
      sync_install = false,
      auto_install = true,
      query_linter = {
        enable = true,
        use_virtual_text = true,
        lint_events = { "BufWrite", "CursorHold" },
      },
    }
  }
}
