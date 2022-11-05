require'lsp_ruby'
-- require'core/options'
require('Comment').setup()

-- require new configuration
local modules = {
  'core.options',
  'core.keymapping',
}

for _, module in ipairs(modules) do
  local ok, err = pcall(require, module)
  if not ok then
    error('Error loading ' .. module .. '\n\n' .. err)
  end
end
