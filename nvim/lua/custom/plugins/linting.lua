return {
  "mfussenegger/nvim-lint",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local lint = require "lint"

    vim.g.lint_enabled = true

    lint.linters_by_ft = {
      javascript = { "eslint_d" },
      typescript = { "eslint_d" },
      javascriptreact = { "eslint_d" },
      typescriptreact = { "eslint_d" },
      svelte = { "eslint_d" },
      swift = { "swiftlint" },
    }

    local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

    vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
      group = lint_augroup,
      callback = function()
        if vim.g.lint_enabled then
          lint.try_lint()
        end
      end,
    })

    vim.keymap.set("n", "<leader>cl", function()
      lint.try_lint()
    end, { desc = "Trigger [C]ode [L]inting for current file" })

    vim.keymap.set("n", "<leader>tl", function()
      vim.g.lint_enabled = not vim.g.lint_enabled
      if vim.g.lint_enabled then
        lint.try_lint()
      else
        vim.diagnostic.reset()
      end
      vim.notify("Linting: " .. (vim.g.lint_enabled and "ON" or "OFF"))
    end, { desc = "[T]oggle [L]inting" })
  end,
}
