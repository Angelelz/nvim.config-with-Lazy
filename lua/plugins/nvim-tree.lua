return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  keys = {
    {
      "<leader>e",
      function()
        local api = require("nvim-tree.api")
        api.tree.toggle({
          path = require("lazyvim.util").root(),
        })
      end,
      desc = "Explorer (root dir)",
      remap = true,
    },
    {
      "<leader>E",
      function()
        local api = require("nvim-tree.api")
        api.tree.toggle({
          path = vim.loop.cwd(),
        })
      end,
      desc = "Explorer (cwd)",
      remap = true,
    },
  },
  config = function()
    require("nvim-tree").setup({
      view = {
        width = 40,
      },

      renderer = {
        icons = {
          glyphs = {
            folder = {
              arrow_closed = "→",
              arrow_open = "↓",
            },
          },
        },
      },

      actions = {
        open_file = {
          window_picker = {
            enable = true,
          },
        },
      },
      filters = {
        custom = { ".DS_Store" },
      },
      git = {
        ignore = false,
      },
    })
  end,
}
