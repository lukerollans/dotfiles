-- do a bunch of useful stuff around language
-- servers. does not reside in lsp.lua as null-ls
-- augments the language servers rather than defining them

return {
  {
    'nvimtools/none-ls.nvim',
    priority = 1500,
    opts = function(_, opts)
      local nls = require("null-ls")
      opts.sources = {
        nls.builtins.formatting.biome,
      }
    end
  },
}
