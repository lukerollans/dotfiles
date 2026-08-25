-- nicer cmdline and messages
vim.pack.add({
  'https://github.com/MunifTanjim/nui.nvim',
  'https://github.com/folke/noice.nvim',
})

require('noice').setup({
  routes = {
    -- don't label matches with the search term and count while searching
    {
      filter = { event = 'msg_show', kind = 'search_count' },
      opts = { skip = true },
    },
  },
  lsp = {
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"] = true,
    },
    signature = {
      auto_open = {
        enabled = false,
      }
    }
  },
  cmdline = {
    format = {
      cmdline = {
        icon = ""
      },
      search_down = {
        icon = "",
      },
      search_up = {
        icon = ""
      },
      filter = {
        icon = ""
      }
    },
  },
})
