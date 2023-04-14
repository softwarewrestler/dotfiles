return {
  'mfussenegger/nvim-jdtls',
  'tpope/vim-fugitive',
  'mrjones2014/nvim-ts-rainbow',
  'f-person/git-blame.nvim',
  --'seandewar/nvimesweeper',
  {
    'dracula/vim',
    name = 'dracula',
    config = function()
      vim.cmd([[colorscheme dracula]])
    end
  },
}
