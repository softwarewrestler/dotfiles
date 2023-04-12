return {
  'mfussenegger/nvim-jdtls',
  {
    'dracula/vim',
    name = 'dracula',
    config = function()
      vim.cmd([[colorscheme dracula]])
    end
  },
}
