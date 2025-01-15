return {
	{
		"romgrk/barbar.nvim",
		dependencies = {
			"lewis6991/gitsigns.nvim", -- OPTIONAL: for git status
			"nvim-tree/nvim-web-devicons", -- OPTIONAL: for file icons
		},
		init = function()
			vim.g.barbar_auto_setup = false

			local opts = { noremap = true, silent = true }
			vim.keymap.set("n", "<S-h>", "<Cmd>BufferPrevious<CR>", opts)
			vim.keymap.set("n", "<S-l>", "<Cmd>BufferNext<CR>", opts)
			vim.keymap.set("n", "<Leader>x", "<Cmd>BufferClose<CR>", opts)
		end,
		opts = {
			-- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
			-- animation = true,
			-- insert_at_start = true,
			-- …etc.
		},
		-- version = '^1.0.0', -- optional: only update when a new 1.x version is released
	},
}
