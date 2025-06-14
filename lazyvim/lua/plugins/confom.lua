-- if true then
--   return {}
-- end

return {
  "stevearc/conform.nvim",
  opts = function()
    local opts = {
      default_format_opts = {
        timeout_ms = 3000,
        async = false, -- not recommended to change
        quiet = false, -- not recommended to change
        lsp_format = "fallback", -- not recommended to change
      },
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
        yml = { "yamlfix" },
        markdown = { "prettier" },
        graphql = { "prettier" },
        -- liquid = { "prettier" },
        lua = { "stylua" },
        -- python = { "isort", "black" },
        ruby = { "rubocop" },
        -- eruby = { "erb_format" },
        sh = { "shfmt" },
        tf = { "tflint" },
        terraform = { "tflint" },
        hcl = { "tflint" },
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
            YAMLFIX_LINE_LENGTH = 120,
            -- YAMLFIX_quote_basic_values = "false",
            -- YAMLFIX_quote_representation = "'",
            --
            YAMLFIX_preserve_quotes = "true",
            YAMLFIX_EXPLICIT_START = "false",
            YAMLFIX_COMMENTS_REQUIRE_STARTING_SPACE = "false",
            YAMLFIX_COMMENTS_MIN_SPACES_FROM_CONTENT = "1",
          },
        },
        prettier = {
          prepend_args = { "--quote-props", "preserve", "--single-quote", "true" },
        },
      },
      -- format_after_save = {
      --   lsp_format = "fallback",
      -- },
      -- format_on_save = {
      --   lsp_fallback = true,
      --   async = false,
      --   timeout_ms = 5000,
      -- },
    }
    return opts
  end,
}
