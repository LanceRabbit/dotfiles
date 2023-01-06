-- ref: https://github.com/neovim/nvim-lspconfig/blob/master/lua/lspconfig/server_configurations/ruby_ls.lua

local lspconfig = require'lspconfig'

return {
  filetypes = { 'ruby' },
  init_options = {
    enabledFeatures = {
      "codeActions", "diagnostics", "documentHighlights", "documentSymbols", "formatting", "inlayHint"
    }
  },
  root_dir = { lspconfig.util.root_pattern("Gemfile", ".git") },
  cmd = { 'ruby-lsp' }
}