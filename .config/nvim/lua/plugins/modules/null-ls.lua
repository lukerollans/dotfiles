-- do a bunch of useful stuff around language
-- servers. does not reside in lsp.lua as null-ls
-- augments the language servers rather than defining them
vim.pack.add({
  'https://github.com/nvim-lua/plenary.nvim',
  'https://github.com/nvimtools/none-ls.nvim',
})

local null_ls = require('null-ls')

null_ls.setup({
  sources = {
    null_ls.builtins.formatting.biome,
  },
})
