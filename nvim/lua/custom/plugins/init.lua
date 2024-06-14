return {
  "nvim-lua/plenary.nvim",
  -- "tpope/vim-fugitive",
  -- "mrjones2014/nvim-ts-rainbow",
  -- "f-person/git-blame.nvim",
  {
    "dracula/vim",
    name = "dracula",
    config = function()
      vim.cmd([[colorscheme dracula]])
    end,
  },
}
