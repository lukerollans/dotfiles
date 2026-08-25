-- plugins are managed by the built-in vim.pack, which needs 0.12+
if vim.fn.has('nvim-0.12') == 0 then
  vim.notify('this config requires neovim 0.12+ (found ' .. tostring(vim.version()) .. ')', vim.log.levels.ERROR)
  return
end

vim.loader.enable()

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- options first so things like 'background' are set before the colorscheme loads
require('config.options')

require('plugins')

require('config.keymaps')
require('config.autocmds')
