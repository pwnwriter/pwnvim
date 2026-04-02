vim.pack.add({ { src = "https://github.com/folke/snacks.nvim" } })

local ok, snacks = pcall(require, "snacks")
if not ok then return end

snacks.setup({
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
})

local map = require("mappings").map
map("n", "<leader>o", function() require("snacks").scratch() end, "Toggle scratch pad")
map("n", "<leader>E", function() require("snacks").picker.explorer() end, "Toggle snacks explorer")
map("n", "<leader>F", function() require("snacks").picker.pick("files") end, "Toggle find files snacks")
map({ "n", "t" }, "<A-t>", function() require("snacks").terminal() end, "Toggle terminal buffer")
