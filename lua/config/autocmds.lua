-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
-- local function opts(desc)
--   return { desc = "nvim-tree: " .. desc, noremap = true, silent = true, nowait = true }
-- end
-- local api = require("nvim-tree.api")
-- vim.keymap.set("n", "<leader>e", api.tree.toggle, opts("Toggle"))

vim.opt.undodir = (os.getenv("HOME") or os.getenv("LOCALAPPDATA")) .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"

vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
-- require("notify").setup({
--   background_colour = "#000000",
-- })
-- vim.api.nvim_command("au ColorScheme * hi Normal ctermbg=None")

vim.opt.ic = false
vim.opt.wrap = true
