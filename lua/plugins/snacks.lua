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

    require("mappings").map({ "n" }, "<leader>F", function()
      require("snacks").picker.pick("files")
    end, "Toggle find files snacks"),

    require("mappings").map({ "n", "t" }, "<A-t>", function()
      require("snacks").terminal()
    end, "Toggle terminal buffer")

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
