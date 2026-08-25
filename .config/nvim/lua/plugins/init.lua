-- plugins are managed by neovim's built-in plugin manager (vim.pack, 0.12+).
-- each module below installs its own plugins with vim.pack.add() and then
-- configures them. update plugins with :lua vim.pack.update()

-- build hooks must be registered before the first vim.pack.add() call
require('plugins.hooks')

-- modules load in this order. the first few entries are order-sensitive:
-- theme before anything draws, autopairs before autocomplete (the <CR>
-- mapping delegates to autopairs), common (which-key) before claude
local modules = {
  'theme',
  'treesitter',
  'lsp',
  'autopairs',
  'autocomplete',
  'telescope',
  'common',
  'bufferline',
  'claude',
  'cmdline',
  'formatting',
  'git',
  'lazygit',
  'statusline',
  'tmux',
}

for _, module in ipairs(modules) do
  require('plugins.modules.' .. module)
end
