-- various formatting related plugins
vim.pack.add({
  'https://github.com/lukas-reineke/indent-blankline.nvim', -- show indentation guides on blank lines
})

require('ibl').setup({
  indent = {
    char = '┊',
  },
  scope = {
    enabled = false
  }
})
