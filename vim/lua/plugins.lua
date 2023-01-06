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
  use { "wbthomason/packer.nvim", commit = "6afb67460283f0e990d35d229fd38fdc04063e0a" } --  Package manager
  use { "nvim-lua/plenary.nvim", commit = "4b7e52044bbb84242158d977a50c4cbcd85070c7" } -- Useful lua functions used by lots of plugins

  -- vim version START
  use { 'vim-airline/vim-airline' }

  use { 'mileszs/ack.vim' }
  use { 'tpope/vim-fugitive' }
  use { 'junegunn/fzf' }
  use { 'junegunn/fzf.vim' }
  use { 'tpope/vim-surround' }
  use { 'tpope/vim-repeat' }
  use { 'slim-template/vim-slim' }
  use { 'vim-ruby/vim-ruby' }
  use { 'tpope/vim-rails' }

  use { 'MarcWeber/vim-addon-mw-utils' }
  use { 'tomtom/tlib_vim' }
  use { 'garbas/vim-snipmate' }
  use { 'honza/vim-snippets' }
  -- select mulit line
  use { 'mg979/vim-visual-multi' }
  -- vim version END


  -- cmp plugins
  use "hrsh7th/nvim-cmp" -- The completion plugin
  use "hrsh7th/cmp-buffer" -- buffer completions
  use "hrsh7th/cmp-path" -- path completions
  use "hrsh7th/cmp-cmdline" -- cmdline completions
  use "saadparwaiz1/cmp_luasnip" -- snippet completions
  use { "hrsh7th/cmp-nvim-lsp", commit = "3cf38d9c957e95c397b66f91967758b31be4abe6" }
	use { "hrsh7th/cmp-nvim-lua", commit = "d276254e7198ab7d00f117e88e223b4bd8c02d21" }

  -- snippets
  use "L3MON4D3/LuaSnip" --snippet engine
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use


  -- LSP
	use { "neovim/nvim-lspconfig", commit = "f11fdff7e8b5b415e5ef1837bdcdd37ea6764dda" } -- enable LSP
  use { "williamboman/mason.nvim", commit = "c2002d7a6b5a72ba02388548cfaf420b864fbc12"} -- simple to use language server installer
  use { "williamboman/mason-lspconfig.nvim", commit = "0051870dd728f4988110a1b2d47f4a4510213e31" }
	use { "jose-elias-alvarez/null-ls.nvim", commit = "c0c19f32b614b3921e17886c541c13a72748d450" } -- for formatters and linters
  use { "RRethy/vim-illuminate", commit = "a2e8476af3f3e993bb0d6477438aad3096512e42" }

  -- for rust
  use { 'simrat39/rust-tools.nvim' }
  use { 'mfussenegger/nvim-dap' }

  -- Telescope
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    config = function()
      require('config.telescope')
    end
  }

  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    commit = "8e763332b7bf7b3a426fd8707b7f5aa85823a5ac",
    config = function()
      require('config.treesitter')
    end
  }
  use {
    "windwp/nvim-autopairs",
    config = function()
      require('config.autopairs')
    end
  }
  use {
    'numToStr/Comment.nvim',
    commit = "97a188a98b5a3a6f9b1b850799ac078faa17ab67",
    config = function()
      require('config.comment')
    end
  }

  use {
    "akinsho/bufferline.nvim",
    commit = "83bf4dc7bff642e145c8b4547aa596803a8b4dc4",
    config = function()
      require('config.bufferline')
    end

  }

  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional, for file icons
    },
    config = function()
      require('config.nvim-tree')
    end
  }

  use({
    "folke/noice.nvim",
    config = function()
      require('config.noice')
    end,
    requires = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    }
  })

  -- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
  if is_bootstrap then
    require('packer').sync()
  end
end)

