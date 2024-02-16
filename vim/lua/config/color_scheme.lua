local scheme_status_ok, scheme = pcall(require, 'tokyonight')
if not scheme_status_ok then
  return
end

-- nmap <silent><unique> <Leader>bg :SwitchBG<CR>

scheme.setup({
  -- or leave it empty to use the default settings
  style = "moon", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
})

--  Set the configuration BEFORE loading the color scheme with colorscheme tokyonight.
vim.cmd [[colorscheme tokyonight]]
