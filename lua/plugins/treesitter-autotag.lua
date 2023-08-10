return {
  {
    "nvim-treesitter/nvim-treesitter",
    -- opts = overrides.treesitter,
  },
  {
    "windwp/nvim-ts-autotag",
    dependencies = "nvim-treesitter/nvim-treesitter",
    config = function()
      require("nvim-ts-autotag").setup({
        -- your config
        autotag = {
          enable = true,
        },
      })
    end,
    lazy = true,
    event = "VeryLazy",
  },
}
