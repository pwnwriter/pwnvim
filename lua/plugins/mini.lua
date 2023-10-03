local binder = require("config.binder").new()

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
  local hipatterns = require("mini.hipatterns")
  local bufremove = require("mini.bufremove")

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

  -- Configure files
  binder:with_modes({ "n" })
  binder:with_desc("Toggle mini files")
  files.setup({
    binder:bind("<leader>e", function()
      local success = files.close()
      if not success then
        files.open()
      end
    end),
  })

  -- Configure patterns
  hipatterns.setup({
    highlighters = {
      -- Highlight standalone 'FIXME', 'HACK', 'TODO', 'NOTE'
      -- Highlight standalone 'FIXME', 'HACK', 'TODO', 'NOTE'
      fixme = { pattern = "%f[%w]()FIXME()%f[%W]", group = "MiniHipatternsFixme" },
      hack = { pattern = "%f[%w]()HACK()%f[%W]", group = "MiniHipatternsHack" },
      todo = { pattern = "%f[%w]()TODO()%f[%W]", group = "MiniHipatternsTodo" },
      note = { pattern = "%f[%w]()NOTE()%f[%W]", group = "MiniHipatternsNote" },

      -- Highlight hex color strings (`#rrggbb`) using that color
      hex_color = hipatterns.gen_highlighter.hex_color(),
    },
  })

  -- Configure buffer-remover
  binder:with_modes({ "n" })
  binder:with_desc("Remove current buffers")
  bufremove.setup({
    silent = false,
    binder:bind("<c-q>", function()
      bufremove.delete()
    end),
  })
end

return spec
