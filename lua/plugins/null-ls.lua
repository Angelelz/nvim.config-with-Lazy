return {
  {
    "jose-elias-alvarez/null-ls.nvim",
    opts = function(_, opts)
      local nls = require("null-ls")
      table.insert(opts.sources, nls.builtins.formatting.prettierd)
      -- table.insert(opts.sources, nls.builtins.formatting.dprint.with(require('plugins.dprint')))
    end,
  },
}
