-- require'pakcer'

-- require custom configuration
local modules = {
  'core.lazy',
  'core.options',
  'core.keymapping',
  'core.autocmds',
  -- 'config.lsp',
  -- 'config.cmp',
}

for _, module in ipairs(modules) do
  local ok, err = pcall(require, module)
  if not ok then
    error('Error loading ' .. module .. '\n\n' .. err)
  end
end
