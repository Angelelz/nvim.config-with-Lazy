return {
  "tpope/vim-fugitive",
  keys = {
    {
      "<leader>gf",
      function()
        vim.cmd.Git()
      end,
      desc = "Execute fugitive",
    },
  },
}
