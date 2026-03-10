return {
  "folke/snacks.nvim",
  name = "snacks",
  keys = {
    { "<leader>o", function() require("snacks").scratch() end, desc = "Toggle scratch pad" },
    { "<leader>E", function() require("snacks").picker.explorer() end, desc = "Toggle snacks explorer" },
    { "<leader>F", function() require("snacks").picker.pick("files") end, desc = "Toggle find files snacks" },
    { "<A-t>", function() require("snacks").terminal() end, mode = { "n", "t" }, desc = "Toggle terminal buffer" },
  },
  event = { "BufReadPost" },
  opts = {
    statuscolumn = {
      left = { "fold", "git" },
      right = { "mark", "sign" },
    },
    words = {
      enabled = true,
      debounce = 500,
    },
    notifier = {
      wo = {
        winblend = vim.g.winblend,
      },
    },
    indent = {
      scope = {
        treesitter = {
          enabled = true,
        },
      },
    },
  },
}
