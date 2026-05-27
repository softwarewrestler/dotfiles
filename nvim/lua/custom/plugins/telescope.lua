return {
  'nvim-telescope/telescope.nvim',
  event = 'VimEnter',
  dependencies = {
    'nvim-lua/plenary.nvim',
    --'nvim-telescope/telescope-dap.nvim',
    "nvim-tree/nvim-web-devicons",
    { 
        'nvim-telescope/telescope-fzf-native.nvim', 
        build = 'make' 
    },
    'nvim-telescope/telescope-ui-select.nvim',
    "folke/todo-comments.nvim",
  },

  config = function()
    local telescope = require('telescope')
    local actions = require('telescope.actions')

    local open_with_trouble = require("trouble.sources.telescope").open

    telescope.setup({
      extensions = {
        ['ui-select'] = {
          require('telescope.themes').get_dropdown(),
        }
      },
      defaults = {
        prompt_prefix = " ",
        selection_caret = " ",
        path_display = { "shorten" },
        file_ignore_patterns = { ".git/", "node_modules", "target/" },

        mappings = {
          i = {
            --["<Down>"] = actions.cycle_history_next,
            --["<Up>"] = actions.cycle_history_prev,
            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,
            ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
            ["<C-t>"] = open_with_trouble,
          },
        },
      },
    })

    telescope.load_extension("fzf")
    telescope.load_extension("ui-select")

    -- key maps
    vim.keymap.set("n", "<leader>fh", ":Telescope help_tags<CR>", { desc = "[F]ind [H]elp", noremap = true, silent = true })
    vim.keymap.set("n", "<leader>fk", ":Telescope keymaps<CR>", { desc = "[F]ind [K]eymaps", noremap = true, silent = true })
    vim.keymap.set("n", "<leader>ff", ":Telescope find_files<CR>", { desc = "[F]ind [F]iles", noremap = true, silent = true })
    vim.keymap.set(
      "n",
      "<leader>fs",
      ":Telescope builtin<CR>",
      { desc = "[F]ind [S]elect Telescope", noremap = true, silent = true }
    )
    vim.keymap.set(
      "n",
      "<leader>fw",
      ":Telescope grep_string<CR>",
      { desc = "[F]ind current [W]ord", noremap = true, silent = true }
    )
    vim.keymap.set("n", "<leader>ft", ":Telescope live_grep<CR>", { desc = "[F]ind by [G]rep", noremap = true, silent = true })
    vim.keymap.set(
      "n",
      "<leader>fd",
      ":Telescope diagnostics<CR>",
      { desc = "[F]ind [D]iagnostics", noremap = true, silent = true }
    )
    vim.keymap.set("n", "<leader>fr", ":Telescope resume<CR>", { desc = "[F]ind [R]esume", noremap = true, silent = true })
    vim.keymap.set(
      "n",
      "<leader>f.",
      ":Telescope oldfiles<CR>",
      { desc = '[F]ind Recent Files ("." for repeat)', noremap = true, silent = true }
    )
    vim.keymap.set(
      "n",
      "<leader><leader>",
      ":Telescope buffers<CR>",
      { desc = "[ ] Find existing buffers", noremap = true, silent = true }
    )
    vim.keymap.set("n", "<leader>fc", ":TodoTelescope<CR>", {desc = "[F]ind Todo [C]omments"})

    local builtin = require('telescope.builtin')
    vim.keymap.set('n', '<leader>/', function()
      -- You can pass additional configuration to Telescope to change the theme, layout, etc.
      builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
        winblend = 10,
        previewer = false,
      })
    end, { desc = '[/] Fuzzily search in current buffer' })



  end
}
