local status_ok, nvim_lsp = pcall(require, "lspconfig")
if not status_ok then
  return
end

--
require("config.lsp.mason_setting")
require("config.lsp.handlers").setup()

-- require("config.lsp.null-ls")
-- for test
-- require "config.lsp.settings.p-lsp"
