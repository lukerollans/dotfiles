-- use telescope for fuzzy finding!
vim.pack.add({
  'https://github.com/nvim-lua/plenary.nvim',
  'https://github.com/nvim-tree/nvim-web-devicons',
  'https://github.com/nvim-telescope/telescope-fzf-native.nvim', -- built by plugins.hooks
  'https://github.com/nvim-telescope/telescope-ui-select.nvim',
  'https://github.com/nvim-telescope/telescope.nvim',
})

local telescope = require('telescope')

telescope.setup {
  defaults = {
    previewer = false,
    hidden = true,
    file_ignore_patterns = { "node_modules", "package-lock.json" },
    initial_mode = "insert",
    select_strategy = "reset",
    sorting_strategy = "ascending",
    mappings = {
      i = {
        ["<C-j>"] = "move_selection_next",
        ["<C-k>"] = "move_selection_previous",
      }
    }
  },
  pickers = {
    git_files = {
      theme = "dropdown",
      previewer = false
    }
  },
  extensions = {
    fzf = {
      fuzzy = true,                   -- false will only do exact matching
      override_generic_sorter = true, -- override the generic sorter
      override_file_sorter = true,    -- override the file sorter
      case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
    },
    ["ui-select"] = {
      require("telescope.themes").get_dropdown({
        previewer        = false,
        initial_mode     = "normal",
        sorting_strategy = "ascending",
        layout_strategy  = "horizontal",
        layout_config = {
          horizontal = {
            width = 0.5,
            height = 0.4,
            preview_width = 0.6,
          },
        },
      })
    },
  }
}

telescope.load_extension("fzf")
telescope.load_extension("ui-select")
