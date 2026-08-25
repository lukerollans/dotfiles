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
map('n', 'gT', ':BufferLineCyclePrev<CR>')
map('n', 'gb', ':BufferLinePick<CR>')

-- telescope keymaps
map('n', '<C-p>', function() require('telescope.builtin').git_files() end, { desc = 'Search [G]it [F]iles' })
map('n', '<C-[>', function() require('telescope.builtin').live_grep() end, { desc = '[S]earch by [G]rep' })
map('n', '<leader>ff', function() require('telescope.builtin').find_files() end, { desc = '[S]earch [F]iles' })
map('n', '<leader>sh', function() require('telescope.builtin').help_tags() end, { desc = '[S]earch [H]elp' })
map('n', '<leader>sw', function() require('telescope.builtin').grep_string() end, { desc = '[S]earch current [W]ord' })
map('n', '<leader>sd', function() require('telescope.builtin').diagnostics() end, { desc = '[S]earch [D]iagnostics' })

-- telescope fuzzy find in current buffer
map('n', '<leader>/', function()
  local themes = require('telescope.themes')
  require('telescope.builtin').current_buffer_fuzzy_find(themes.get_dropdown {
    previewer = false,
  })
end)

-- diagnostics keymaps ([d and ]d are built in since 0.11)
map('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
map('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })
