local toggleterm_status_ok, toggleterm = pcall(require, 'toggleterm')
if not toggleterm_status_ok then
  return
end

toggleterm.setup({
  direction = 'float',
  open_mapping = [[<c-b>]]
})
