return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				javascript = { "prettier" },
				typescript = { "prettier" },
				javascriptreact = { "prettier" },
				typescriptreact = { "prettier" },
				-- svelte = { "prettier" },
				css = { "prettier" },
				html = { "prettier" },
				json = { "prettier" },
				yaml = { "yamlfix" },
				markdown = { "prettier" },
				graphql = { "prettier" },
				-- liquid = { "prettier" },
				lua = { "stylua" },
				-- python = { "isort", "black" },
				ruby = { "rubocop" },
				-- eruby = { "erb_format" },
				sh = { "shfmt" },
				tf = { "tfmt" },
				terraform = { "tfmt" },
				hcl = { "tfmt" },
			},
			formatters = {
				rubocop = {
					-- args = { "-a", "-f", "quiet", "--stderr", "--stdin", "$FILENAME" },
					args = { "--server", "--auto-correct-all", "--stderr", "--force-exclusion", "--stdin", "$FILENAME" },
				},
				yamlfix = {
					-- REF: https://lyz-code.github.io/yamlfix/#quote-basic-values
					env = {
						YAMLFIX_SEQUENCE_STYLE = "block_style",
						YAMLFIX_quote_basic_values = "true",
						YAMLFIX_quote_representation = '"',
						YAMLFIX_EXPLICIT_START = "false",
						YAMLFIX_COMMENTS_REQUIRE_STARTING_SPACE = "false",
						YAMLFIX_COMMENTS_MIN_SPACES_FROM_CONTENT = "1",
					},
				},
				prettier = {
					prepend_args = { "--quote-props", "preserve", "--single-quote", "true" },
				},
			},
			format_on_save = {
				lsp_fallback = true,
				async = false,
				timeout_ms = 5000,
			},
		})

		vim.keymap.set({ "n", "v" }, "<leader>mp", function()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 1000,
			})
		end, { desc = "Format file or range (in visual mode)" })
	end,
}
