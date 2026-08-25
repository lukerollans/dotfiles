-- syntax highlighting and parsing (nvim-treesitter 'main' rewrite)
vim.pack.add({
  { src = 'https://github.com/nvim-treesitter/nvim-treesitter', version = 'main' },
  { src = 'https://github.com/nvim-treesitter/nvim-treesitter-textobjects', version = 'main' },
})

-- install parsers (async; already-installed parsers are skipped)
require('nvim-treesitter').install({
  'bash',
  'elixir',
  'go',
  'heex',
  'html',
  'javascript',
  'json',
  'lua',
  'markdown',
  'markdown_inline',
  'prisma',
  'terraform',
  'tsx',
  'typescript',
  'vim',
  'vimdoc',
  'yaml',
})

-- start highlighting and indentation in any buffer with an installed parser
vim.api.nvim_create_autocmd('FileType', {
  group = vim.api.nvim_create_augroup('treesitter_start', { clear = true }),
  callback = function(ev)
    if pcall(vim.treesitter.start, ev.buf) then
      vim.bo[ev.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    end
  end,
})

-- textobjects
require('nvim-treesitter-textobjects').setup({
  select = {
    lookahead = true,
    selection_modes = {
      ['@parameter.outer'] = 'v',   -- charwise
      ['@parameter.inner'] = 'v',   -- charwise
      ['@function.outer'] = 'v',    -- charwise
      ['@conditional.outer'] = 'V', -- linewise
      ['@loop.outer'] = 'V',        -- linewise
      ['@class.outer'] = '<c-v>',   -- blockwise
    },
    include_surrounding_whitespace = false,
  },
  move = {
    set_jumps = true, -- whether to set jumps in the jumplist
  },
})

local map = vim.keymap.set

local selects = {
  af = { '@function.outer', 'around a function' },
  ['if'] = { '@function.inner', 'inner part of a function' },
  ac = { '@class.outer', 'around a class' },
  ic = { '@class.inner', 'inner part of a class' },
  ai = { '@conditional.outer', 'around an if statement' },
  ii = { '@conditional.inner', 'inner part of an if statement' },
  al = { '@loop.outer', 'around a loop' },
  il = { '@loop.inner', 'inner part of a loop' },
}
for lhs, select in pairs(selects) do
  map({ 'x', 'o' }, lhs, function()
    require('nvim-treesitter-textobjects.select').select_textobject(select[1], 'textobjects')
  end, { desc = select[2] })
end

local moves = {
  goto_next_start = {
    [']f'] = { '@function.outer', 'Next function' },
    [']c'] = { '@class.outer', 'Next class' },
    [']p'] = { '@parameter.inner', 'Next parameter' },
  },
  goto_previous_start = {
    ['[f'] = { '@function.outer', 'Previous function' },
    ['[c'] = { '@class.outer', 'Previous class' },
    ['[p'] = { '@parameter.inner', 'Previous parameter' },
  },
}
for direction, mappings in pairs(moves) do
  for lhs, move in pairs(mappings) do
    map({ 'n', 'x', 'o' }, lhs, function()
      require('nvim-treesitter-textobjects.move')[direction](move[1], 'textobjects')
    end, { desc = move[2] })
  end
end

-- parameter swapping (not on <leader>a/<leader>A: that's the claude prefix)
map('n', '<leader>x', function()
  require('nvim-treesitter-textobjects.swap').swap_next('@parameter.inner')
end, { desc = 'Swap with next parameter' })
map('n', '<leader>X', function()
  require('nvim-treesitter-textobjects.swap').swap_previous('@parameter.inner')
end, { desc = 'Swap with previous parameter' })
