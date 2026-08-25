-- language servers: native vim.lsp.config/enable with nvim-lspconfig's server
-- definitions, mason to install server binaries
vim.pack.add({
  'https://github.com/neovim/nvim-lspconfig',
  'https://github.com/mason-org/mason.nvim',
  'https://github.com/mason-org/mason-lspconfig.nvim',
  'https://github.com/b0o/schemastore.nvim', -- json and yaml schema stores
  'https://github.com/nvim-lua/plenary.nvim',
  'https://github.com/elixir-tools/elixir-tools.nvim',
})

-- per-server settings, merged over nvim-lspconfig's definitions

-- configure Lua specific settings
vim.lsp.config('lua_ls', {
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' },
      },
      workspace = {
        library = {
          vim.env.VIMRUNTIME .. '/lua',
          vim.fn.stdpath('config') .. '/lua',
        },
      },
    },
  },
})

-- configure JSON specific settings
vim.lsp.config('jsonls', {
  settings = {
    json = {
      schemas = require('schemastore').json.schemas(),
      validate = { enable = true },
    },
  },
})

-- configure yaml specific settings
vim.lsp.config('yamlls', {
  settings = {
    yaml = {
      schemaStore = {
        enable = false,
      },
      schemas = require('schemastore').yaml.schemas(),
      validate = { enable = true },
    },
  },
})

-- configure eslint specific settings
vim.lsp.config('eslint', {
  settings = {
    format = true,
    workingDirectory = {
      mode = 'location',
    },
  },
})

require('mason').setup()
require('mason-lspconfig').setup({
  ensure_installed = {
    'ts_ls',
    'eslint',
    'jsonls',
    'yamlls',
    'bashls',
    'vimls',
    'elixirls',
    'prismals',
    'terraformls',
    'gopls',
  },
  -- elixir-tools runs its own elixir-ls instance; don't start a second one
  automatic_enable = {
    exclude = { 'elixirls' },
  },
})

-- servers used when installed locally rather than through mason
for server, binary in pairs({ astro = 'astro-ls', lua_ls = 'lua-language-server' }) do
  if vim.fn.executable(binary) == 1 then
    vim.lsp.enable(server)
  end
end

-- define how diagnostics manifest
vim.diagnostic.config({
  underline = false,
  virtual_text = false,
  update_in_insert = false,
  severity_sort = true,
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = 'E',
      [vim.diagnostic.severity.WARN] = 'W',
      [vim.diagnostic.severity.HINT] = 'H',
      [vim.diagnostic.severity.INFO] = 'I',
    },
  },
  float = {
    source = true,
    style = 'minimal',
    border = 'rounded',
    header = '',
    prefix = '',
  },
})

-- format these servers' buffers on save
local format_on_save = {
  ts_ls = true,
  elixirls = true,
  jsonls = true,
  prismals = true,
  gopls = true,
}

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('lsp_attach', { clear = true }),
  callback = function(ev)
    local client = assert(vim.lsp.get_client_by_id(ev.data.client_id))
    local map = function(mode, lhs, rhs)
      vim.keymap.set(mode, lhs, rhs, { buffer = ev.buf })
    end

    -- on top of the built-in maps (K, grn, gra, gri, grt, gO, <C-s>, [d/]d)
    map('n', 'gd', vim.lsp.buf.definition)
    map('n', 'gD', vim.lsp.buf.declaration)
    map('n', 'go', vim.lsp.buf.type_definition)
    map('n', 'gl', vim.diagnostic.open_float)
    map('n', 'grr', '<cmd>Telescope lsp_references<cr>')

    if format_on_save[client.name] then
      vim.api.nvim_create_autocmd('BufWritePre', {
        buffer = ev.buf,
        callback = function()
          vim.lsp.buf.format({ bufnr = ev.buf, id = client.id, timeout_ms = 10000 })
        end,
      })
    end

    -- automatically resolve all fixable eslint issues when the buffer saves
    if client.name == 'eslint' then
      vim.api.nvim_create_autocmd('BufWritePre', {
        buffer = ev.buf,
        command = 'LspEslintFixAll',
      })
    end
  end,
})

-----------------------------------------
-- language specific: Elixir           --
-----------------------------------------
local elixir = require('elixir')
local elixirls = require('elixir.elixirls')

elixir.setup {
  credo = {},
  elixirls = {
    enable = true,
    settings = elixirls.settings {
      dialyzerEnabled = false,
      enableTestLenses = false,
    },
    on_attach = function()
      vim.keymap.set('n', '<space>fp', ':ElixirFromPipe<cr>', { buffer = true, noremap = true })
      vim.keymap.set('n', '<space>tp', ':ElixirToPipe<cr>', { buffer = true, noremap = true })
      vim.keymap.set('v', '<space>em', ':ElixirExpandMacro<cr>', { buffer = true, noremap = true })
      vim.opt_local.textwidth = 180
    end,
  },
}
