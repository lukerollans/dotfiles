-- show open buffers along the top like tabs
local colours = require("config.colours").colours

vim.pack.add({
  'https://github.com/nvim-tree/nvim-web-devicons',
  'https://github.com/akinsho/bufferline.nvim',
})

require("bufferline").setup({
  options = {
    indicator = {
      icon = " ",
    },
    always_show_bufferline = true,
    show_close_icon = false,
    tab_size = 0,
    max_name_length = 25,
   custom_areas = {
     left = function()
       return {
         { text = "    ", fg = colours.fg },
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
