return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local conform = require "conform"

    vim.g.format_on_save = false

    conform.setup {
      formatters_by_ft = {
        javascript = { "prettier" },
        typescript = { "prettier" },
        javascriptreact = { "prettier" },
        typescriptreact = { "prettier" },
        css = { "prettier" },
        html = { "prettier" },
        json = { "prettier" },
        yaml = { "prettier" },
        markdown = { "prettier" },
        graphql = { "prettier" },
        lua = { "stylua" },
        java = { "google-java-format" },
        swift = { "swift-format" },
      },
    }

    vim.api.nvim_create_autocmd("BufWritePre", {
      group = vim.api.nvim_create_augroup("ConformFormatOnSave", { clear = true }),
      callback = function(args)
        if vim.g.format_on_save then
          conform.format { bufnr = args.buf, lsp_fallback = true, async = false, timeout_ms = 1000 }
        end
      end,
    })

    vim.keymap.set({ "n", "v" }, "<leader>cf", function()
      conform.format {
        lsp_fallback = true,
        async = false,
        timeout_ms = 1000,
      }
    end, { desc = "[C]ode [F]ormat file or range (in visual mode)" })

    vim.keymap.set("n", "<leader>tf", function()
      vim.g.format_on_save = not vim.g.format_on_save
      vim.notify("Format on save: " .. (vim.g.format_on_save and "ON" or "OFF"))
    end, { desc = "[T]oggle [F]ormat on save" })
  end,
}
