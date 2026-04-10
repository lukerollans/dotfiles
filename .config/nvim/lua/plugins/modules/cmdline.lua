return {
  "folke/noice.nvim",
  event = "VeryLazy",
  opts = {
    lsp = {
      override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
        ["cmp.entry.get_documentation"] = true,
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
  },
  dependencies = {
    -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
    "MunifTanjim/nui.nvim"
  }
}
