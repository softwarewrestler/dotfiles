return {
  'mfussenegger/nvim-jdtls',
  'tpope/vim-fugitive',
  'mrjones2014/nvim-ts-rainbow',
  'f-person/git-blame.nvim',
  --'seandewar/nvimesweeper',
  {
    "jim-fx/sudoku.nvim",
    cmd = "Sudoku",
    config = function ()
      require("sudoku").setup {}
    end
  },
  {
    'dracula/vim',
    name = 'dracula',
    config = function()
      vim.cmd([[colorscheme dracula]])
    end
  },
}
