return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    -- "jayp0521/mason-null-ls.nvim",
  },
  config = function()
    -- import mason
    local mason = require("mason")

    -- import mason-lspconfig
    local mason_lspconfig = require("mason-lspconfig")

    local mason_tool_installer = require("mason-tool-installer")

    -- import mason-null-ls
    -- local mason_null_ls = require("mason-null-ls")

    -- enable mason and configure icons
    mason.setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })

    mason_lspconfig.setup({
      -- list of servers for mason to install
      ensure_installed = {
        "tsserver",
        "html",
        "cssls",
        "tailwindcss",
        "svelte",
        "lua_ls",
        "graphql",
        "emmet_ls",
        "prismals",
        "pyright",
        "zls",
        "rust_analyzer",
      },
      -- auto-install configured servers (with lspconfig)
      automatic_installation = true, -- not the same as ensure_installed
    })

    mason_tool_installer.setup({
      -- list of tools for mason to install
      ensure_installed = {
        "stylua",
        "dprint",
        "black",
        "isort",
        "pylint",
        "prettier",
        "eslint_d",
        "rust_analyzer",
        "sqlfmt",
      },
    })

    -- mason_null_ls.setup({
    --   -- list of formatters & linters for mason to install
    --   ensure_installed = {
    --     "prettier", -- ts/js formatter
    --     "dprint",
    --     "stylua", -- lua formatter
    --     "eslint_d", -- ts/js linter
    --   },
    --   -- auto-install configured servers (with lspconfig)
    --   automatic_installation = true,
    -- })
  end,
}
