return {
  "stevearc/conform.nvim",
  dependencies = { "mason.nvim" },
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
  ---@class ConformOpts
  opts = {
    ---@type table<string, conform.FormatterUnit[]>
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
    format = {
      lsp_fallback = true,
      async = false,
      quiet = false,
      timeout_ms = 3000,
    },
    -- LazyVim will merge the options you set here with builtin formatters.
    -- You can also define any custom formatters here.
    ---@type table<string, conform.FormatterConfigOverride|fun(bufnr: integer): nil|conform.FormatterConfigOverride>
    formatters = {
      injected = { options = { ignore_errors = true } },
      dprint = {
        condition = function(ctx)
          local hasConfig = vim.fs.find({ "dprint.json" }, { path = ctx.filename, upward = true })[1]
          if hasConfig then
            print("using dprint")
          end
          return hasConfig
        end,
      },
      prettier = {
        condition = function(ctx)
          local hasConfig = vim.fs.find({
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
          if hasConfig then
            print("using prettier")
          end
          return hasConfig
        end,
      },
    },
  },
}
