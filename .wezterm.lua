local wezterm = require 'wezterm'
local config = wezterm.config_builder()

-- generic window styling
config.hide_tab_bar_if_only_one_tab = true
config.window_padding = {
  left = "8px",
  right = 0,
  top = "8px",
  bottom = 0,
}

-- customise font rendering
config.font = wezterm.font 'Berkeley Mono'
config.font_size = 14.0
config.line_height = 1.3

-- customise colouring
config.colors = {
  background = '#1d2022',
  cursor_bg = '#ccc',
}

return config
