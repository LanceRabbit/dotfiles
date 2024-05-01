local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  return
end

-- need to reinstall language server when upgrade neovim version.
-- example: TSInstall javascript

configs.setup({
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
  }, -- one of "all" or a list of languages
  ignore_install = { "phpdoc" }, -- List of parsers to ignore installing
  highlight = {
    enable = false, -- false will disable the whole extension
    disable = { "css", "lua" } -- list of language that will be disabled
  },
  autopairs = {
    enable = true,
  },
  indent = { enable = true, disable = { "python", "css" } },
})
