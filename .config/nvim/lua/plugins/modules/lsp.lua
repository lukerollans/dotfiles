-- set up language server provider
return {
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    lazy = false,
    dependencies = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' },
      {
        'williamboman/mason.nvim',
        build = function()
          pcall(vim.cmd, 'MasonUpdate')
        end,
      },
      { 'williamboman/mason-lspconfig.nvim' },

      { 'L3MON4D3/LuaSnip' }, -- snippet engine
      { 'onsails/lspkind.nvim' }, -- pictograms in autocompletion menu
      { 'b0o/schemastore.nvim' } -- json and yaml schema stores
    },
    config = function()
      local lsp = require('lsp-zero').preset('recommended')

      lsp.ensure_installed({
        'ts_ls',
        'eslint',
        'jsonls',
        'yamlls',
        'bashls',
        'vimls',
        'elixirls',
        'prismals',
        'terraformls',
        -- 'astro',
        -- 'rust_analyzer',
        'gopls',
        -- 'lua_ls',
        -- 'intelephense',
      })

      -- set keymappings once attached
      lsp.on_attach(function(_, bufnr)
        lsp.default_keymaps({ buffer = bufnr })
        vim.keymap.set('n', 'gr', '<cmd>Telescope lsp_references<cr>', { buffer = true })
      end)

      -- format buffers on save if they're attached to a language server
      lsp.format_on_save({
        format_opts = {
          async = false,
          timeout_ms = 10000,
        },
        servers = {
          ['ts_ls'] = { 'javascript', 'typescript', 'javascriptreact', 'typescriptreact' },
          ['elixirls'] = { 'elixir', 'eex' },
          ['jsonls'] = { 'json' },
          ['prismals'] = { 'prisma' },
          -- ['astro'] = { 'astro' },
          -- ['lua_ls'] = { 'lua' },
          -- ['rust_analyzer'] = { 'rust' },
          ['gopls'] = { 'go' },
        }
      })

      -- tweak some basic preferences
      lsp.set_preferences({
        suggest_lsp_servers = false,
        sign_icons = {
          error = "E",
          warn = "W",
          hint = "H",
          info = "I",
        },
      })

      -- define how diagnostics manifest
      vim.diagnostic.config({
        underline = false,
        virtual_text = false,
        signs = true,
        update_in_insert = false,
        severity_sort = true,
        float = {
          source = "always",
          style = "minimal",
          border = "rounded",
          header = "",
          prefix = "",
        },
      })

      local lspconfig = require('lspconfig')

      -- configure TypeScript specific settings
      lspconfig.ts_ls.setup {}

      -- wire up Astro files
      lspconfig.astro.setup {}

      -- configure Lua specific settings
      lspconfig.lua_ls.setup({
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" },
            },
            workspace = {
              library = {
                [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                [vim.fn.stdpath("config") .. "/lua"] = true,
              },
            },
          },
        },
      })

      -- configure JSON specific settings
      lspconfig.jsonls.setup({
        settings = {
          json = {
            schemas = require('schemastore').json.schemas(),
            validate = { enable = true },
          }
        }
      })

      -- configure yaml specific settings
      lspconfig.yamlls.setup({
        settings = {
          yaml = {
            schemaStore = {
              enable = false
            },
            schemas = require('schemastore').yaml.schemas(),
            validate = { enable = true },
          }
        }
      })

      -- configure eslint specific settings
      require('lspconfig').eslint.setup({
        on_attach = function(client, bufnr)
          -- automatically resolve all fixable eslint
          -- issues when the buffer saves
          vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = bufnr,
            command = "EslintFixAll",
          })
        end,
        settings = {
          format = true,
          workingDirectory = {
            mode = 'location' 
          },
        },
      })

      -- Prisma ORM specific settings
      lspconfig.prismals.setup {}

      -- all configured, start 'er up
      lsp.setup()
    end
  },

  -- inlay hints
  {
    'simrat39/inlay-hints.nvim',
    config = function()
      require("inlay-hints").setup({
        only_current_line = false,
        eol = {
          right_align = false,
        }
      })
    end
  },

  -----------------------------------------
  -- language specific: Elixir           --
  -----------------------------------------
  -- elixir-tools
  {
    "elixir-tools/elixir-tools.nvim",
    lazy = true,
    enabled = true,
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local elixir = require("elixir")
      local elixirls = require("elixir.elixirls")

      elixir.setup {
        credo = {},
        elixirls = {
          enable = true,
          settings = elixirls.settings {
            dialyzerEnabled = false,
            enableTestLenses = false,
          },
          on_attach = function()
            vim.keymap.set("n", "<space>fp", ":ElixirFromPipe<cr>", { buffer = true, noremap = true })
            vim.keymap.set("n", "<space>tp", ":ElixirToPipe<cr>", { buffer = true, noremap = true })
            vim.keymap.set("v", "<space>em", ":ElixirExpandMacro<cr>", { buffer = true, noremap = true })
            vim.opt_local.textwidth = 180
          end,
        }
      }
    end,
  },
}

