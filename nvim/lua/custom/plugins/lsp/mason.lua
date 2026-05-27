return {
  {
    "williamboman/mason-lspconfig.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "neovim/nvim-lspconfig",
      "hrsh7th/cmp-nvim-lsp",
      {
        "williamboman/mason.nvim",
        opts = {
          ui = {
            icons = {
              package_installed = "✓",
              package_pending = "➜",
              package_uninstalled = "✗",
            },
          },
        },
      },
    },
    opts = {
      -- list of servers for mason to install
      ensure_installed = {
        "ts_ls",
        "html",
        "cssls",
        "lua_ls",
        "graphql",
        "emmet_ls",
        "eslint",
        "jdtls",
      },
      handlers = {
        function(server_name)
          local lspconfig = require("lspconfig")
          local cmp_nvim_lsp = require("cmp_nvim_lsp")
          local capabilities = cmp_nvim_lsp.default_capabilities()
          capabilities.textDocument.completion.completionItem.snippetSupport = true

          lspconfig[server_name].setup({
            capabilities = capabilities,
          })
        end,
        -- Lua LSP with special settings
        lua_ls = function()
          local lspconfig = require("lspconfig")
          local cmp_nvim_lsp = require("cmp_nvim_lsp")
          local capabilities = cmp_nvim_lsp.default_capabilities()
          capabilities.textDocument.completion.completionItem.snippetSupport = true

          lspconfig.lua_ls.setup({
            capabilities = capabilities,
            settings = {
              Lua = {
                diagnostics = {
                  globals = { "vim" },
                },
                completion = {
                  callSnippet = "Replace",
                },
                telemetry = {
                  enable = false,
                },
              },
            },
          })
        end,
        -- GraphQL LSP with extended filetypes
        graphql = function()
          local lspconfig = require("lspconfig")
          local cmp_nvim_lsp = require("cmp_nvim_lsp")
          local capabilities = cmp_nvim_lsp.default_capabilities()
          capabilities.textDocument.completion.completionItem.snippetSupport = true

          lspconfig.graphql.setup({
            capabilities = capabilities,
            filetypes = { "graphql", "gql", "typescriptreact", "javascriptreact" },
          })
        end,
        -- Emmet LSP with extended filetypes
        emmet_ls = function()
          local lspconfig = require("lspconfig")
          local cmp_nvim_lsp = require("cmp_nvim_lsp")
          local capabilities = cmp_nvim_lsp.default_capabilities()
          capabilities.textDocument.completion.completionItem.snippetSupport = true

          lspconfig.emmet_ls.setup({
            capabilities = capabilities,
            filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
          })
        end,
        -- Java LSP (jdtls) - configured separately in ftplugin/java.lua
        jdtls = function() end,
      },
    },
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      ensure_installed = {
        "prettier", -- prettier formatter
        "stylua", -- lua formatter
        "eslint_d",
        "google-java-format", -- Java formatter
      },
    },
    dependencies = {
      "williamboman/mason.nvim",
    },
  },
}
