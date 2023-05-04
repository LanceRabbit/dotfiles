local function rust_lsp()
  local rust_tools_status, rust_tool = pcall(require, "rust-tools")
  if not rust_tools_status then
    return
  end

  rust_tool.setup({
    -- rust-tools options
    tools = {
      autoSetHints = true,
      inlay_hints = {
        show_parameter_hints = true,
        parameter_hints_prefix = "<- ",
        other_hints_prefix = "=> ",
      },
    },

    -- all the opts to send to nvim-lspconfig
    -- these override the defaults set by rust-tools.nvim
    --
    -- REFERENCE:
    -- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
    -- https://rust-analyzer.github.io/manual.html#configuration
    -- https://rust-analyzer.github.io/manual.html#features
    --
    -- NOTE: The configuration format is `rust-analyzer.<section>.<property>`.
    --       <section> should be an object.
    --       <property> should be a primitive.
    server = {
      -- on_attach = require("config.lsp.handlers").on_attach,
      on_attach = function(_, bufnr)
        -- Hover actions
        vim.keymap.set("n", "<Leader>b", rust_tool.hover_actions.hover_actions, { buffer = bufnr })
        vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)

        -- Code action groups
        vim.keymap.set("n", "<Leader>a", rust_tool.code_action_group.code_action_group, { buffer = bufnr })
      end,
      -- on_attach = function(client, bufnr)
      --   require("settings/shared").on_attach(client, bufnr)
      --   require("illuminate").on_attach(client)
      --
      --   local bufopts = { noremap = true, silent = true, buffer = bufnr }
      --   vim.keymap.set('n', '<leader><leader>rr', "<Cmd>RustRunnables<CR>", bufopts)
      --   vim.keymap.set('n', 'K', "<Cmd>RustHoverActions<CR>", bufopts)
      -- end,
      ["rust-analyzer"] = {
        assist = {
          importEnforceGranularity = true,
          importPrefix = "crate"
        },
        cargo = {
          allFeatures = true,
          autoReload = true
        },
        checkOnSave = {
          -- default: `cargo check`
          command = "clippy",
          allFeatures = true,
        },
      },
      inlayHints = { -- NOT SURE THIS IS VALID/WORKS 😬
        lifetimeElisionHints = {
          enable = true,
          useParameterNames = true
        },
      },
    }
  })
end

local servers = {
  "solargraph",
  "rust_analyzer",
  'sumneko_lua',
  'terraformls',
}

local settings = {
  ui = {
    border = "none",
    icons = {
      package_installed = "◍",
      package_pending = "◍",
      package_uninstalled = "◍",
    },
  },
  log_level = vim.log.levels.INFO,
  max_concurrent_installers = 4,
}

require("mason").setup(settings)
require("mason-lspconfig").setup({
  ensure_installed = {
    'sumneko_lua',
    'solargraph',
    'rust_analyzer',
  },
  automatic_installation = true,
})


local capabilities = require('cmp_nvim_lsp').default_capabilities()
local on_attach = require("config.lsp.handlers").on_attach
local opts = {
  capabilities = capabilities,
  on_attach = on_attach
}

-- require('mason-lspconfig').setup_handlers({
--   function(server_name)
--     require('lspconfig')[server_name].setup(opts)
--   end,
--   sumneko_lua = function()
--     require('lspconfig').sumneko_lua.setup(vim.tbl_extend('force', opts, {
--       settings = {
--         Lua = {
--           diagnostics = {
--             globals = { 'vim' }
--           }
--         }
--       }
--     }))
--   end,
-- })


local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
  return
end

for _, server in pairs(servers) do
  server = vim.split(server, "@")[1]

  local require_ok, conf_opts = pcall(require, "config.lsp.settings." .. server)
  if require_ok then
    opts = vim.tbl_extend("force", conf_opts, opts)
    -- opts = vim.tbl_deep_extend("force", conf_opts, opts)
  end

  if server == 'rust_analyzer' then
    rust_lsp()
  else
    lspconfig[server].setup(opts)
  end
end
