-- plugins related to git functionality/integration
vim.pack.add({
  'https://github.com/lewis6991/gitsigns.nvim', -- add git signs to the gutter
})

local gitsigns = require('gitsigns')

gitsigns.setup({
  on_attach = function(bufnr)
    vim.keymap.set('n', '<leader>gp', function() gitsigns.nav_hunk('prev') end, { buffer = bufnr, desc = '[G]o to [P]revious Hunk' })
    vim.keymap.set('n', '<leader>gn', function() gitsigns.nav_hunk('next') end, { buffer = bufnr, desc = '[G]o to [N]ext Hunk' })
    vim.keymap.set('n', '<leader>ph', gitsigns.preview_hunk, { buffer = bufnr, desc = '[P]review [H]unk' })
  end,
})
