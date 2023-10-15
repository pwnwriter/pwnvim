local binder = require("config.binder").new()
local M = {}

M.pairs = {
  modes = { insert = true, command = false, terminal = false },
  mappings = {
    ["("] = { action = "open", pair = "()", neigh_pattern = "[^\\]." },
    ["["] = { action = "open", pair = "[]", neigh_pattern = "[^\\]." },
    ["{"] = { action = "open", pair = "{}", neigh_pattern = "[^\\]." },
    [")"] = { action = "close", pair = "()", neigh_pattern = "[^\\]." },
    ["]"] = { action = "close", pair = "[]", neigh_pattern = "[^\\]." },
    ["}"] = { action = "close", pair = "{}", neigh_pattern = "[^\\]." },
    ['"'] = { action = "closeopen", pair = '""', neigh_pattern = "[^\\].", register = { cr = false } },
    ["'"] = { action = "closeopen", pair = "''", neigh_pattern = "[^%a\\].", register = { cr = false } },
    ["`"] = { action = "closeopen", pair = "``", neigh_pattern = "[^\\].", register = { cr = false } },
    ["<"] = { action = "closeopen", pair = "<>", neigh_pattern = "[^\\].", register = { cr = false } },
  },
}

M.surround = {
  highlight_duration = 500,
  mappings = {
    add = "sa",
    delete = "sd",
    find = "sf",
    highlight = "sh",
    replace = "sr",
    find_left = "sF",
    update_n_lines = "sn",
    suffix_last = "l",
    suffix_next = "n",
  },
  n_lines = 20,
  respect_selection_type = false,
  search_method = "cover",
  silent = true,
}

binder:with_modes { "n" }

M.files = {
  windows = { preview = false, width_focus = 25, width_preview = 40, height_focus = 20, border = "solid" },
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
  binder:with_desc("Toggle mini files"):bind("<leader>e", function()
    local success = require("mini.files").close()
    if not success then
      require("mini.files").open()
    end
  end),
}

M.hipatterns = {
  highlighters = {
    fixme = { pattern = "%f[%w]()FIXME()%f[%W]", group = "MiniHipatternsFixme" },
    hack = { pattern = "%f[%w]()HACK()%f[%W]", group = "MiniHipatternsHack" },
    todo = { pattern = "%f[%w]()TODO()%f[%W]", group = "MiniHipatternsTodo" },
    note = { pattern = "%f[%w]()NOTE()%f[%W]", group = "MiniHipatternsNote" },
    hex_color = require("mini.hipatterns").gen_highlighter.hex_color(),
  },
}

binder:with_modes { "n" }
M.bufremove = {
  silent = true,
  binder:with_desc("Remove current buffers"):bind("<c-q>", function()
    require("mini.bufremove").delete()
  end),
}

binder:with_modes { "n" }
local MiniPick = require "mini.pick"
local builtin = MiniPick.builtin

M.pick = {
  options = {
    use_cache = true,
  },
  binder:with_desc("Open files "):bind("<leader>ff", function()
    builtin.files()
  end),
  binder:with_desc("Open buffers"):bind("<leader>b", function()
    builtin.buffers()
  end),
  binder:with_desc("Resume using"):bind("<leader>fr", function()
    builtin.resume()
  end),
  binder:with_desc("Grep live"):bind("<leader>fw", function()
    builtin.grep_live()
  end),
}

M.move = {

mappings = {
    -- Move visual selection in Visual mode. Changing from Alt (Meta) + hjkl to Shift + hjkl.
    left = '<S-h>',
    right = '<S-l>',
    down = '<S-j>',
    up = '<S-k>',

    -- Move current line in Normal mode
    line_left = '<S-h>',
    line_right = '<S-l>',
    line_down = '<S-j>',
    line_up = '<S-k>',
},
}

return M
