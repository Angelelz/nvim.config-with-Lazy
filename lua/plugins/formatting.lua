return {
  "stevearc/conform.nvim",
  -- event = { "BufReadPre", "BufNewFile" },
  lazy = true,
  cmd = "ConformInfo",
  keys = {
    {
      "<leader>cF",
      function()
        require("conform").format({ formatters = { "injected" } })
      end,
      mode = { "n", "v" },
      desc = "Format Injected Langs",
    },
  },
  init = function()
    -- `require("lazyvim.plugins.lsp.format")` is deprecated. Please use `require("lazyvim.util").format` instead
    vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
    -- Install the conform formatter on VeryLazy
    require("lazyvim.util").on_very_lazy(function()
      ---@diagnostic disable-next-line: duplicate-set-field
      require("lazyvim.util").format.format = function(opts)
        return require("conform").format({ bufnr = opts.buf, timeout_ms = 3000, async = false, lsp_fallback = true })
      end
    end)
  end,
  opts = {
    formatters_by_ft = {
      javascript = { "prettier", "dprint" },
      typescript = { "prettier", "dprint" },
      javascriptreact = { "prettier", "dprint" },
      typescriptreact = { "prettier", "dprint" },
      svelte = { "prettier" },
      css = { "prettier" },
      html = { "prettier" },
      json = { "prettier" },
      yaml = { "prettier" },
      markdown = { "prettier" },
      graphql = { "prettier" },
      lua = { "stylua" },
      python = { "black", "isort" },
    },
    format_on_save = {
      lsp_fallback = true,
      async = false,
      timeout_ms = 3000,
    },
    -- LazyVim will merge the options you set here with builtin formatters.
    -- You can also define any custom formatters here.
    ---@type table<string,table>
    formatters = {
      injected = { options = { ignore_errors = true } },
      -- -- Example of using dprint only when a dprint.json file is present
      dprint = {
        condition = function(ctx)
          print("using dprint")
          return vim.fs.find({ "dprint.json" }, { path = ctx.filename, upward = true })[1]
        end,
      },
      prettier = {
        condition = function(ctx)
          print("using prettier")
          return vim.fs.find({
            ".prettierrc.json",
            ".prettierrc",
            ".prettierrc.yml",
            ".prettierrc.yaml",
            ".prettierrc.json5",
            ".prettierrc.js",
            "prettier.config.js",
            ".prettierrc.mjs",
            "prettier.config.mjs",
            ".prettierrc.cjs",
            "prettier.config.cjs",
            ".prettierrc.toml",
          }, { path = ctx.filename, upward = true })[1]
        end,
      },
    },
  },
  config = function(_, opts)
    opts.formatters = opts.formatters or {}
    for name, formatter in pairs(opts.formatters) do
      if type(formatter) == "table" then
        local ok, defaults = pcall(require, "conform.formatters." .. name)
        if ok and type(defaults) == "table" then
          print("Using formatter: " .. name)
          opts.formatters[name] = vim.tbl_deep_extend("force", {}, defaults, formatter)
        end
      end
    end
    require("conform").setup(opts)
    -- local conform = require("conform")
    -- local formatingOptions = {
    --   lsp_fallback = true,
    --   async = false,
    --   timeout = 1000,
    -- }
    --
    -- conform.setup({
    --   formatters_by_ft = {
    --     javascript = { "prettier", "dprint" },
    --     typescript = { "prettier", "dprint" },
    --     javascriptreact = { "prettier", "dprint" },
    --     typescriptreact = { "prettier", "dprint" },
    --     svelte = { "prettier" },
    --     css = { "prettier" },
    --     html = { "prettier" },
    --     json = { "prettier" },
    --     yaml = { "prettier" },
    --     markdown = { "prettier" },
    --     graphql = { "prettier" },
    --     lua = { "stylua" },
    --     python = { "black", "isort" },
    --   },
    --
    --   format_on_save = formatingOptions,
    -- })

    -- vim.keymap.set({ "n", "v" }, "<leader>cf", function()
    --   conform.format(formatingOptions)
    -- end, { desc = "Format file or range" })
  end,
}
