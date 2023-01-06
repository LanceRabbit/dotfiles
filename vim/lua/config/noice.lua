local noice_status_ok, noice = pcall(require, 'noice')
if not noice_status_ok then
	return
end

noice.setup()

local notify_status_ok, notify = pcall(require, 'notify')
if not notify_status_ok then
	return
end

notify.setup({
  render = 'minimal'
})
