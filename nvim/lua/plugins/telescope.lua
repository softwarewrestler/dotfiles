return {
  'nvim-telescope/telescope.nvim',
  dependencies = {
      'nvim-lua/plenary.nvim',
    --'nvim-telescope/telescope-dap.nvim',
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    'nvim-telescope/telescope-ui-select.nvim',
  },
  config = function()
    local actions = require "telescope.actions"

    require('telescope').setup({
      defaults = {
        prompt_prefix = " ",
        selection_caret = " ",
        path_display = { "smart" },
        file_ignore_patterns = { ".git/", "node_modules" },

        mappings = {
          i = {
            --["<Down>"] = actions.cycle_history_next,
            --["<Up>"] = actions.cycle_history_prev,
            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,
          },
        },
      },
    })
    require('telescope').load_extension("fzf")
    require('telescope').load_extension("ui-select")
  end,
}
