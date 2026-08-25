vim.loader.enable()

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- options first so things like 'background' are set before the colorscheme loads
require('config.options')

require('plugins')

require('config.keymaps')
require('config.autocmds')
