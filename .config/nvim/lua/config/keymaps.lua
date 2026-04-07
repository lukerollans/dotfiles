-- bind custom keymappings
local map = vim.keymap.set

-- better default experience
map({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- switch between last two files
map('n', '<leader><leader>', '<c-^>')

-- format the current buffer (hopefully temporary)
map('n', '<leader>gf', ':lua vim.lsp.buf.format()<CR>')

-- bufferline (tab bar) navigation
map('n', 'gt', ':BufferLineCycleNext<CR>')
map('n', 'gr', ':BufferLineCyclePrev<CR>')
map('n', 'gb', ':BufferLinePick<CR>')

-- convenience to open current directory as a buffer (oil)
map('n', '-', '<CMD>Oil<CR>', { desc = 'Open current directory as a buffer' })

-- telescope keymaps
map('n', '<C-p>', require('telescope.builtin').git_files, { desc = 'Search [G]it [F]iles' })
map('n', '<C-[>', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
map('n', '<leader>ff', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
map('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
map('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
map('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })

-- telescope fuzzy find in current buffer
map('n', '<leader>/', function()
  local themes = require('telescope.themes')
  require('telescope.builtin').current_buffer_fuzzy_find(themes.get_dropdown {
    previewer = false,
  })
end)

-- diagnostics keymaps
map('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
map('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
map('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
map('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })
