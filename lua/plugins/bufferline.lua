return {
  "akinsho/bufferline.nvim",
  -- optional = true,
  -- opts = function()
  --   local Offset = require("bufferline.offset")
  --   if not Offset.edgy then
  --     local get = Offset.get
  --     Offset.get = function()
  --       if package.loaded.edgy then
  --         local layout = require("edgy.config").layout
  --         local ret = { left = "", left_size = 0, right = "", right_size = 0 }
  --         for _, pos in ipairs({ "left", "right" }) do
  --           local sb = layout[pos]
  --           if sb and #sb.wins > 0 then
  --             local title = " Sidebar" .. string.rep(" ", sb.bounds.width - 8)
  --             ret[pos] = "%#EdgyTitle#" .. title .. "%*" .. "%#WinSeparator#│%*"
  --             ret[pos .. "_size"] = sb.bounds.width
  --           end
  --         end
  --         ret.total_size = ret.left_size + ret.right_size
  --         if ret.total_size > 0 then
  --           return ret
  --         end
  --       end
  --       return get()
  --     end
  --     Offset.edgy = true
  --   end
  -- end,
  event = "VeryLazy",
  opts = {
    options = {
      -- stylua: ignore
      close_command = function(n) require("mini.bufremove").delete(n, false) end,
      -- stylua: ignore
      right_mouse_command = function(n) require("mini.bufremove").delete(n, false) end,
      diagnostics = "nvim_lsp",
      always_show_bufferline = true,
      diagnostics_indicator = function(_, _, diag)
        local icons = require("lazyvim.config").icons.diagnostics
        local ret = (diag.error and icons.Error .. diag.error .. " " or "")
          .. (diag.warning and icons.Warn .. diag.warning or "")
        return vim.trim(ret)
      end,
      separator_style = "slant",
      offsets = {
        {
          filetype = "neo-tree",
          text = "Neo-tree",
          highlight = "Directory",
          text_align = "left",
        },
      },
    },
  },
  keys = {
    { "<C-.>", "<cmd>BufferLineMoveNext<cr>", { desc = "Move buffer to the right" } },
    { "<C-,>", "<cmd>BufferLineMovePrev<cr>", { desc = "Move buffer to the left" } },
    { "<leader>bp", "<Cmd>BufferLineTogglePin<CR>", desc = "Toggle pin" },
    { "<leader>bP", "<Cmd>BufferLineGroupClose ungrouped<CR>", desc = "Delete non-pinned buffers" },
  },
}
