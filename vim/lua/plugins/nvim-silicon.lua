local plugins = {
	"michaelrommel/nvim-silicon",
	lazy = true,
	cmd = "Silicon",
	config = function()
		require("silicon").setup({
			font = "Menlo=34", -- Menlo is a monospaced font included on macOS
			theme = "Dracula",
			-- background = "#f1adc8",
			window_title = function()
				return vim.fn.fnamemodify(vim.api.nvim_buf_get_name(vim.api.nvim_get_current_buf()), ":t")
			end,
			-- output = function()
			-- 	local custom_path = vim.fn.expand("$HOME/Desktop/")
			-- 	return custom_path .. os.date("!%Y-%m-%dT%H-%M-%S") .. "_code.png"
			-- end,
		})
	end,
}

return plugins
