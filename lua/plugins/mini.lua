local binder = require("config.binder")

local spec = {
  "echasnovski/mini.nvim",
  name = "mini",
  version = "*",
  event = { "VeryLazy" },
  keys = {
    "<leader>e",
  },
}

function spec:config()
  local pairs = require("mini.pairs")
  local surround = require("mini.surround")
  local comment = require("mini.comment")
  local files = require("mini.files")

  -- Configure pairs
  pairs.setup({
    modes = { insert = true, command = false, terminal = false },
    mappings = {
      ["("] = { action = "open", pair = "()", neigh_pattern = "[^\\]." },
      ["["] = { action = "open", pair = "[]", neigh_pattern = "[^\\]." },
      ["{"] = { action = "open", pair = "{}", neigh_pattern = "[^\\]." },
      [")"] = { action = "close", pair = "()", neigh_pattern = "[^\\]." },
      ["]"] = { action = "close", pair = "[]", neigh_pattern = "[^\\]." },
      ["}"] = { action = "close", pair = "{}", neigh_pattern = "[^\\]." },
      ["\""] = {
        action = "closeopen",
        pair = "\"\"",
        neigh_pattern = "[^\\].",
        register = { cr = false },
      },
      ["'"] = {
        action = "closeopen",
        pair = "''",
        neigh_pattern = "[^%a\\].",
        register = { cr = false },
      },
      ["`"] = {
        action = "closeopen",
        pair = "``",
        neigh_pattern = "[^\\].",
        register = { cr = false },
      },
      ["<"] = {
        action = "closeopen",
        pair = "<>",
        neigh_pattern = "[^\\].",
        register = { cr = false },
      },
    },
  })

  -- Configure surround
  surround.setup({
    custom_surroundings = nil,
    highlight_duration = 500,
    mappings = {
      -- Define your surround mappings here
      add = "sa",
      delete = "sd",
      find = "sf",
      find_left = "sF",
      highlight = "sh",
      replace = "sr",
      update_n_lines = "sn",
      suffix_last = "l",
      suffix_next = "n",
    },
    n_lines = 20,
    respect_selection_type = false,
    search_method = "cover",
    silent = true,
  })

  -- Configure comment
  comment.setup({
    comment = "gc",
    comment_line = "gcc",
    textobject = "gc",
  })

  local binder = binder.new():with_modes({ "n" })

  files.setup({
    binder:bind("<leader>e", function()
      local success = files.close()
      if not success then
        files.open()
      end
    end),
  })
end

return spec
