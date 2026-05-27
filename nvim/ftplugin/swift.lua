-- Swift-specific settings
vim.opt_local.shiftwidth = 4
vim.opt_local.tabstop = 4

-- Setup sourcekit-lsp using vim.lsp.start() (Nvim 0.11+ API)
local util = require("lspconfig.util")
local cmp_nvim_lsp = require("cmp_nvim_lsp")

-- Get capabilities
local capabilities = cmp_nvim_lsp.default_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- Configure and start sourcekit-lsp
vim.lsp.start({
  name = "sourcekit_lsp",
  cmd = { "sourcekit-lsp" },
  filetypes = { "swift" },
  root_dir = util.root_pattern("Package.swift", ".git") or util.find_git_ancestor() or vim.fn.getcwd(),
  single_file_support = true,
  capabilities = capabilities,
}, { bufnr = 0, reuse_client = "always" })
