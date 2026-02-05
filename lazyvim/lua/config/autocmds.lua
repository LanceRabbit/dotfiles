-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

---Create an autocommand
---returns the group ID so that it can be cleared or manipulated.
---@param name string
---@param commands Autocommand[]
---@return number
local function augroup(name, commands)
  -- assert(name ~= 'User', 'The name of an augroup CANNOT be User')

  local id = vim.api.nvim_create_augroup(name, { clear = true })

  for _, autocmd in ipairs(commands) do
    -- validate_autocmd(name, autocmd)
    local is_callback = type(autocmd.command) == "function"
    vim.api.nvim_create_autocmd(autocmd.event, {
      group = id,
      pattern = autocmd.pattern,
      desc = autocmd.desc,
      callback = is_callback and autocmd.command or nil,
      command = not is_callback and autocmd.command or nil,
    })
  end

  return id
end

-- local function augroup(name)
--   return vim.api.nvim_create_augroup("lazyvim_" .. name, { clear = true })
-- end
--
-- vim.api.nvim_create_autocmd({ "FocusGained", "TermClose", "TermLeave" }, {
--   group = augroup("checktime"),
--   callback = function()
--     if vim.o.buftype ~= "nofile" then
--       vim.cmd("checktime")
--     end
--   end,
-- })

augroup("SetCursorLine", {
  {
    event = { "WinEnter" },
    pattern = { "*" },
    command = [[setlocal cursorline]],
  },
  {
    event = { "WinLeave" },
    pattern = { "*" },
    command = [[setlocal nocursorline]],
  },
})

-- delete the space at the end of lines before writing from buffer to file.
augroup("CleanSpace", {
  {
    event = { "BufWritePre" },
    pattern = { "*" },
    command = [[:%s/\s\+$//e]],
  },
})

augroup("Spell", {
  {
    event = { "BufRead", "BufNewFile" },
    pattern = { "*" },
    command = [[setlocal spell spelllang=en_us]],
  },
})

augroup("Filetype", {
  {
    event = { "BufRead", "BufNewFile" },
    pattern = { "*.rb" },
    command = [[set filetype=ruby]],
  },
  {
    event = { "BufRead", "BufNewFile" },
    pattern = { "*.html.erb" },
    command = [[set filetype=html]],
  },
  {
    event = { "BufRead", "BufNewFile" },
    pattern = { "*.es6" },
    command = [[set filetype=javascript]],
  },
  {
    event = { "BufRead", "BufNewFile" },
    pattern = { "*.slim" },
    command = [[set filetype=slim]],
  },
  -- 移除 *.tf 的 filetype 覆寫，Neovim 預設會偵測為 terraform
  -- 這樣 conform (terraform_fmt)、LSP、TreeSitter 才能正常運作
  {
    event = { "BufRead", "BufNewFile" },
    pattern = { "*.hcl" },
    command = [[set filetype=hcl]],
  },
})

augroup("Golang", {
  {
    event = { "BufRead", "BufNewFile" },
    pattern = { "*.go" },
    command = [[setlocal noexpandtab tabstop=8 shiftwidth=8]],
  },
})
