return {
{
"neovim/nvim-lspconfig",
event = { "BufReadPre", "BufNewFile" },
dependencies = {
"hrsh7th/cmp-nvim-lsp",
{ "antosha417/nvim-lsp-file-operations", config = true },
{ "folke/neodev.nvim", opts = {} },
},
config = function()
local keymap = vim.keymap

-- Configure diagnostic appearance
local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
for type, icon in pairs(signs) do
local hl = "DiagnosticSign" .. type
vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

-- Configure diagnostic display
vim.diagnostic.config({
virtual_text = {
prefix = "●",
format = function(diagnostic)
return string.format(" %s (%s)", diagnostic.message, diagnostic.source)
end,
},
float = {
source = "always",
},
signs = true,
underline = true,
update_in_insert = false,
severity_sort = true,
})

-- LspAttach autocmd - setup keymaps after LSP attaches
vim.api.nvim_create_autocmd("LspAttach", {
group = vim.api.nvim_create_augroup("UserLspConfig", {}),
callback = function(ev)
local opts = { buffer = ev.buf, silent = true }

-- Navigation
opts.desc = "Show LSP references"
keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts)

opts.desc = "Go to declaration"
keymap.set("n", "gD", vim.lsp.buf.declaration, opts)

opts.desc = "Show LSP definitions"
keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)

opts.desc = "Show LSP implementations"
keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)

opts.desc = "Show LSP type definitions"
keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)

-- Code actions and refactoring
opts.desc = "See available code actions"
keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

opts.desc = "Smart rename"
keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

-- Diagnostics
opts.desc = "Show buffer diagnostics"
keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)

opts.desc = "Show line diagnostics"
keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)

opts.desc = "Toggle virtual text"
keymap.set("n", "<leader>ld", function()
local config = vim.diagnostic.config()
vim.diagnostic.config({ virtual_text = not config.virtual_text })
end, opts)

opts.desc = "Go to previous diagnostic"
keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)

opts.desc = "Go to next diagnostic"
keymap.set("n", "]d", vim.diagnostic.goto_next, opts)

-- Documentation
opts.desc = "Show documentation for what is under cursor"
keymap.set("n", "K", vim.lsp.buf.hover, opts)

opts.desc = "Show signature help"
keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)

-- Setup auto-completion on trigger characters
if ev.data.client_id then
  local client = vim.lsp.get_client_by_id(ev.data.client_id)
  if client and client.server_capabilities.completionProvider then
    -- Set up auto-completion on certain characters
    local trigger_chars = client.server_capabilities.completionProvider.triggerCharacters or {}
    if #trigger_chars > 0 then
      local cmp = require("cmp")
      for _, char in ipairs(trigger_chars) do
        vim.keymap.set("i", char, function()
          vim.api.nvim_feedkeys(char, 'n', true)
          cmp.complete()
        end, { buffer = ev.buf, noremap = true })
      end
    end
  end
end

-- Server management
opts.desc = "Restart LSP"
keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts)

-- Format if server supports it
if ev.data.client_id then
local client = vim.lsp.get_client_by_id(ev.data.client_id)
if client and client.supports_method("textDocument/formatting") then
opts.desc = "Format file"
keymap.set("n", "<leader>cf", function()
vim.lsp.buf.format { async = true }
end, opts)
end
end
end,
})
end,
},
}
