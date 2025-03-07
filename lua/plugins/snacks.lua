return {
  "folke/snacks.nvim",
  name = "snacks",
  keys = {
    require("mappings").map({ "n" }, "<leader>o", function()
      require("snacks").scratch()
    end, "Toggle scratch pad"),

    require("mappings").map({ "n" }, "<leader>E", function()
      require("snacks").picker.explorer()
    end, "Toggle snacks explorer"),

    require("mappings").map({ "n" }, "<leader>ff", function()
      require("snacks").picker.pick("files", opts)
    end, "Toggle find files snacks"),

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
