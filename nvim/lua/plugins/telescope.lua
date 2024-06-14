return {
  'nvim-telescope/telescope.nvim',
  event = 'VimEnter',
  dependencies = {
      'nvim-lua/plenary.nvim',
    --'nvim-telescope/telescope-dap.nvim',
    { 
      'nvim-telescope/telescope-fzf-native.nvim', 
      build = 'make' 
    },
    'nvim-telescope/telescope-ui-select.nvim',
  },
  config = function()
    local actions = require "telescope.actions"

    require('telescope').setup({
      extensions = {
        ['ui-select'] = {
          require('telescope.themes').get_dropdown(),
        }
      },
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
            ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
          },
        },
      },
    })
    require('telescope').load_extension("fzf")
    require('telescope').load_extension("ui-select")

    local builtin = require('telescope.builtin')
    vim.keymap.set('n', '<leader>/', function()
      -- You can pass additional configuration to Telescope to change the theme, layout, etc.
      builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
        winblend = 10,
        previewer = false,
      })
    end, { desc = '[/] Fuzzily search in current buffer' })

  end,
}


--Mappings	Action
--<C-n>/<Down>	Next item
--<C-p>/<Up>	Previous item
--j/k	Next/previous (in normal mode)
--H/M/L	Select High/Middle/Low (in normal mode)
--gg/G	Select the first/last item (in normal mode)
--<CR>	Confirm selection
--<C-x>	Go to file selection as a split
--<C-v>	Go to file selection as a vsplit
--<C-t>	Go to a file in a new tab
--<C-u>	Scroll up in preview window
--<C-d>	Scroll down in preview window
--<C-f>	Scroll left in preview window
--<C-k>	Scroll right in preview window
--<M-f>	Scroll left in results window
--<M-k>	Scroll right in results window
--<C-/>	Show mappings for picker actions (insert mode)
--?	Show mappings for picker actions (normal mode)
--<C-c>	Close telescope (insert mode)
--<Esc>	Close telescope (in normal mode)
--<Tab>	Toggle selection and move to next selection
--<S-Tab>	Toggle selection and move to prev selection
--<C-q>	Send all items not filtered to quickfixlist (qflist)
--<M-q>	Send all selected items to qflist
--<C-r><C-w>	Insert cword in original window into prompt (insert mode)
