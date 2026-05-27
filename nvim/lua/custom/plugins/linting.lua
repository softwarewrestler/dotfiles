return {
  "mfussenegger/nvim-lint",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local lint = require "lint"

    -- Track checkstyle toggle state
    local checkstyle_enabled = false

    lint.linters_by_ft = {
      javascript = { "eslint_d" },
      typescript = { "eslint_d" },
      javascriptreact = { "eslint_d" },
      typescriptreact = { "eslint_d" },
      svelte = { "eslint_d" },
      -- Java linting without checkstyle (disabled by default)
      java = {},
    }

    local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

    vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
      group = lint_augroup,
      callback = function()
        lint.try_lint()
      end,
    })

    -- Toggle checkstyle warnings
    vim.keymap.set("n", "<leader>cs", function()
      checkstyle_enabled = not checkstyle_enabled
      
      if checkstyle_enabled then
        lint.linters_by_ft.java = { "checkstyle" }
        vim.notify("✓ Checkstyle enabled", vim.log.levels.INFO)
      else
        lint.linters_by_ft.java = {}
        vim.notify("✗ Checkstyle disabled", vim.log.levels.INFO)
      end
      
      -- Run linter immediately to show/clear warnings
      lint.try_lint()
    end, { desc = "Toggle [C]heckstyle linter for [S]tyle warnings" })

    -- Manual lint trigger (respects checkstyle toggle state)
    vim.keymap.set("n", "<leader>cl", function()
      lint.try_lint()
    end, { desc = "Trigger [C]ode [L]inting for current file" })
  end,
}
