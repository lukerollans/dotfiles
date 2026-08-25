-- integrates lazygit with neovim
vim.g.lazygit_floating_window_winblend = 1 -- no transparency on floating window
vim.g.lazygit_floating_window_scaling_factor = 0.8 -- make it a little smaller

vim.pack.add({
  'https://github.com/nvim-lua/plenary.nvim',
  'https://github.com/kdheepak/lazygit.nvim',
})

vim.keymap.set('n', '<leader>lg', '<cmd>LazyGit<cr>', { desc = 'LazyGit' })
