return {
  'mfussenegger/nvim-jdtls',
  'tpope/vim-fugitive',
  {
    'dracula/vim',
    name = 'dracula',
    config = function()
      vim.cmd([[colorscheme dracula]])
    end
  },
}
