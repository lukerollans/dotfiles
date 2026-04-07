-- plugins to help nvim work nicer with tmux
return {
  'alexghergh/nvim-tmux-navigation', config = function()
    local map = vim.keymap.set
    local nvim_tmux_nav = require('nvim-tmux-navigation')

    nvim_tmux_nav.setup {
      disable_when_zoomed = true -- defaults to false
    }

    map('n', "<C-h>", nvim_tmux_nav.NvimTmuxNavigateLeft)
    map('n', "<C-j>", nvim_tmux_nav.NvimTmuxNavigateDown)
    map('n', "<C-k>", nvim_tmux_nav.NvimTmuxNavigateUp)
    map('n', "<C-l>", nvim_tmux_nav.NvimTmuxNavigateRight)
    map('n', "<C-\\>", nvim_tmux_nav.NvimTmuxNavigateLastActive)
    map('n', "<C-Space>", nvim_tmux_nav.NvimTmuxNavigateNext)
  end
}
