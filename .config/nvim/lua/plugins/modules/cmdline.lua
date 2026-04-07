return {
  "folke/noice.nvim",
  event = "VeryLazy",
  opts = {
    command_palette = true,
    lsp = {
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
