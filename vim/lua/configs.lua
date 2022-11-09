require'lsp_ruby'
require('Comment').setup()

require('plugins')
-- require new configuration
local modules = {
  'core.options',
  'core.keymapping',
  'core.autocmds',
}

for _, module in ipairs(modules) do
  local ok, err = pcall(require, module)
  if not ok then
    error('Error loading ' .. module .. '\n\n' .. err)
  end
end
