-- claude code integration. claude itself runs in a tmux pane, not inside
-- nvim: this only runs the IDE websocket server, so connect with /ide
-- (or `claude --ide`) to get selections, @-mentions and in-editor diffs
vim.pack.add({
  'https://github.com/folke/snacks.nvim',
  'https://github.com/coder/claudecode.nvim',
})

require('claudecode').setup({
  terminal = { provider = 'none' },
})

local map = vim.keymap.set

map('v', '<leader>as', '<cmd>ClaudeCodeSend<cr>', { desc = 'Send to Claude' })
map('n', '<leader>ab', '<cmd>ClaudeCodeAdd %<cr>', { desc = 'Add current buffer' })
map('n', '<leader>aa', '<cmd>ClaudeCodeDiffAccept<cr>', { desc = 'Accept diff' })
map('n', '<leader>ad', '<cmd>ClaudeCodeDiffDeny<cr>', { desc = 'Deny diff' })

-- add the file under the cursor when inside a file tree
vim.api.nvim_create_autocmd('FileType', {
  group = vim.api.nvim_create_augroup('claudecode_tree_add', { clear = true }),
  pattern = { 'netrw' },
  callback = function(ev)
    map('n', '<leader>as', '<cmd>ClaudeCodeTreeAdd<cr>', { buffer = ev.buf, desc = 'Add file' })
  end,
})

-- jump to the tmux pane running claude after sending a selection
vim.api.nvim_create_autocmd('User', {
  pattern = 'ClaudeCodeSendComplete',
  group = vim.api.nvim_create_augroup('claudecode_send_focus', { clear = true }),
  callback = function()
    if vim.env.TMUX then
      vim.fn.system({ 'tmux', 'select-pane', '-t', '{last}' })
    end
  end,
})

-- label the prefix in which-key
local ok, wk = pcall(require, 'which-key')
if ok then
  wk.add({
    { '<leader>a', group = 'AI/Claude Code' },
  })
end
