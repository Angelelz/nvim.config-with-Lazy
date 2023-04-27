return {
  "Exafunction/codeium.vim",
  config = function()
    -- Change '<C-g>' here to any keycode you like.
    vim.keymap.set("i", "<C-Enter>", function()
      return vim.fn["codeium#Accept"]()
    end, { expr = true })
    -- vim.keymap.set("i", "<Tab>", function()
    --   if require("codeium").GetStatusString() == 0 then
    --     return vim.fn["codeium#Accept"]()
    --   else
    --     print("alksmd")
    --     vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Tab>", true, false, true), "n", false)
    --   end
    -- end, { expr = true })
    vim.keymap.set("i", "<c-;>", function()
      return vim.fn["codeium#CycleCompletions"](1)
    end, { expr = true })
    vim.keymap.set("i", "<c-,>", function()
      return vim.fn["codeium#CycleCompletions"](-1)
    end, { expr = true })
    vim.keymap.set("i", "<c-x>", function()
      return vim.fn["codeium#Clear"]()
    end, { expr = true })
  end,
}
