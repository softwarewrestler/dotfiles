return {
  'mfussenegger/nvim-jdtls',
  'tpope/vim-fugitive',
  'mrjones2014/nvim-ts-rainbow',
  {
    'dracula/vim',
    name = 'dracula',
    config = function()
      vim.cmd([[colorscheme dracula]])
    end
  },
}
