-- Install packer
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
local is_bootstrap = false
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  is_bootstrap = true
  vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
  vim.cmd [[packadd packer.nvim]]
end

-- REF: https://github.com/LunarVim/Neovim-from-scratch/blob/master/lua/user/plugins.lua#L19
-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})


-- Install your plugins here
return packer.startup(function(use)
  use 'wbthomason/packer.nvim'                            -- Package manager

  -- vim version START
  use {'vim-airline/vim-airline'}

  use {'mileszs/ack.vim'}
  use {'tpope/vim-fugitive'}
  use {'junegunn/fzf'}
  use {'junegunn/fzf.vim'}
  use {'tpope/vim-surround'}
  use {'tpope/vim-repeat'}
  use {'slim-template/vim-slim'}
  use {'vim-ruby/vim-ruby'}
  use {'tpope/vim-rails'}

  use {'MarcWeber/vim-addon-mw-utils'}
  use {'tomtom/tlib_vim'}
  use {'garbas/vim-snipmate'}
  use {'honza/vim-snippets'}
  -- vim version END

  -- LSP
  use {'neoclide/coc.nvim', branch = 'release'}
  use { "nvim-lua/plenary.nvim", module = "plenary" }
  use 'neovim/nvim-lspconfig' -- Configurations for Nvim LSP

  -- Telescope
  use {
     'nvim-telescope/telescope.nvim', tag = '0.1.0'
  }
  -- use {
  --   "windwp/nvim-autopairs",
  --   config = function() require("nvim-autopairs").setup {} end
  -- }
  use {
    'numToStr/Comment.nvim',
  }
  use {
    'nvim-tree/nvim-tree.lua'
  }

  use 'nvim-tree/nvim-web-devicons'

  -- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
  if is_bootstrap then
    require('packer').sync()
  end
end)

