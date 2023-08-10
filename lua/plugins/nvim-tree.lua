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
          path = require("lazyvim.util").get_root(),
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
    require("nvim-tree").setup({})
  end,
}
