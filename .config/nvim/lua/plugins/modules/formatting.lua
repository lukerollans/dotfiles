-- various formatting related plugins

return {
  {
    'lukas-reineke/indent-blankline.nvim', -- show indentation guides on blank lines
    main = 'ibl',
    opts = {
      indent = {
        char = '┊',
      },
      scope = {
        enabled = false
      }
    },
  },
}
