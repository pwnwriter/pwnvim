local binder = require("config.binder").new()

local spec = {
  "echasnovski/mini.nvim",
  name = "mini",
  version = "*",
  event = { "UiEnter" },
  keys = { "<leader>e" },
}

function spec:config()
  require("mini.pairs").setup({
    modes = { insert = true, command = false, terminal = false },
    mappings = {
      ["("] = { action = "open", pair = "()", neigh_pattern = "[^\\]." },
      ["["] = { action = "open", pair = "[]", neigh_pattern = "[^\\]." },
      ["{"] = { action = "open", pair = "{}", neigh_pattern = "[^\\]." },
      [")"] = { action = "close", pair = "()", neigh_pattern = "[^\\]." },
      ["]"] = { action = "close", pair = "[]", neigh_pattern = "[^\\]." },
      ["}"] = { action = "close", pair = "{}", neigh_pattern = "[^\\]." },
      ["\""] = { action = "closeopen", pair = "\"\"", neigh_pattern = "[^\\].", register = { cr = false } },
      ["'"] = { action = "closeopen", pair = "''", neigh_pattern = "[^%a\\].", register = { cr = false } },
      ["`"] = { action = "closeopen", pair = "``", neigh_pattern = "[^\\].", register = { cr = false } },
      ["<"] = { action = "closeopen", pair = "<>", neigh_pattern = "[^\\].", register = { cr = false } },
    },
  })

  require("mini.surround").setup({
    highlight_duration = 500,
    mappings = {
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

  require("mini.comment").setup({ comment = "gc", comment_line = "gcc", textobject = "gc" })

  binder:with_modes({ "n" })
  binder:with_desc("Toggle mini files")
  require("mini.files").setup({
    windows = {
    preview = false,
    width_focus = 25,
    width_preview = 40,
    height_focus = 20,
    border = "solid",
  },
  use_as_default_explorer = true,
    mappings = {
      close = "<leader>e",
      go_in = "l",
      go_in_plus = "L",
      go_out = "h",
      go_out_plus = "H",
      reset = "<BS>",
      reveal_cwd = "@",
      show_help = "g?",
      synchronize = "=",
      trim_left = "<",
      trim_right = ">",
    },
    binder:bind("<leader>e", function()
      local success = require("mini.files").close()
      if not success then
        require("mini.files").open()
      end
    end),
  })

  require("mini.hipatterns").setup({
    highlighters = {
      fixme = { pattern = "%f[%w]()FIXME()%f[%W]", group = "MiniHipatternsFixme" },
      hack = { pattern = "%f[%w]()HACK()%f[%W]", group = "MiniHipatternsHack" },
      todo = { pattern = "%f[%w]()TODO()%f[%W]", group = "MiniHipatternsTodo" },
      note = { pattern = "%f[%w]()NOTE()%f[%W]", group = "MiniHipatternsNote" },
      hex_color = require("mini.hipatterns").gen_highlighter.hex_color(),
    },
  })

  binder:with_modes({ "n" })
  binder:with_desc("Remove current buffers")
  require("mini.bufremove").setup({
    silent = true,
    binder:bind("<c-q>", function()
      require("mini.bufremove").delete()
    end),
  })
end

return spec
