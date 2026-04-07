local colours = require("config.colours").colours

return {
  "akinsho/bufferline.nvim",
  version = "*",
  enabled = true,
  dependencies = "nvim-tree/nvim-web-devicons",
  config = function()
    require("bufferline").setup({
      options = {
        indicator = {
          icon = " ",
        },
        always_show_bufferline = true,
        show_close_icon = false,
        tab_size = 0,
        max_name_length = 25,
        offsets = {
          {
            filetype = "oil",
            text = "  Project",
            highlight = "Directory",
            text_align = "left",
          },
        },
       custom_areas = {
         left = function()
         if vim.bo.filetype == "alpha" then
           return {}
         end
         return {
           { text = "    ", fg = colours.fg },
         }
         end,
       },
      },
      highlights = {
        fill = {
          bg = "",
        },
        background = {
          bg = "",
        },
        tab = {
          bg = "",
        },
        tab_close = {
          bg = "",
        },
        tab_separator = {
          fg = colours.bg,
          bg = "",
        },
        tab_separator_selected = {
          fg = colours.bg,
          bg = "",
          sp = colours.fg,
        },
        close_button = {
          bg = "",
          fg = colours.fg,
        },
        close_button_visible = {
          bg = "",
          fg = colours.fg,
        },
        close_button_selected = {
          fg = { attribute = "fg", highlight = "StatusLineNonText" },
        },
        buffer_visible = {
          bg = "",
        },
        modified = {
          bg = "",
        },
        modified_visible = {
          bg = "",
        },
        duplicate = {
          fg = colours.fg,
          bg = ""
        },
        duplicate_visible = {
          fg = colours.fg,
          bg = ""
        },
        separator = {
          fg = colours.bg,
          bg = ""
        },
        separator_selected = {
          fg = colours.bg,
          bg = ""
        },
        separator_visible = {
          fg = colours.bg,
          bg = ""
        },
        offset_separator = {
          fg = colours.bg,
          bg = ""
        },
      },
    })
  end,
}
