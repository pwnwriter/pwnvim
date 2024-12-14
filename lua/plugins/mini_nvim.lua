local M = {}

M.pairs = {
  mappings = {
    ["<"] = { action = "closeopen", pair = "<>", neigh_pattern = "[^\\].", register = { cr = false } },
  },
}

M.files = {
  use_as_default_explorer = true,
  windows = {
    max_number = math.huge,
    preview = false,
    width_focus = 30,
    width_nofocus = 20,
    width_preview = 25,
  },
}

local hipatterns = require "mini.hipatterns"
M.hipatterns = {
  highlighters = {
    fixme = { pattern = "%f[%w]()FIXME()%f[%W]", group = "MiniHipatternsFixme" },
    hack = { pattern = "%f[%w]()HACK()%f[%W]", group = "MiniHipatternsHack" },
    todo = { pattern = "%f[%w]()TODO()%f[%W]", group = "MiniHipatternsTodo" },
    note = { pattern = "%f[%w]()NOTE()%f[%W]", group = "MiniHipatternsNote" },
    hex_color = hipatterns.gen_highlighter.hex_color(),
  },
}

M.bufremove = {
  silent = true,
}

M.comment = {}

M.pick = {
  options = {
    use_cache = true,
  },
}

M.move = {
  mappings = {
    left = "<S-h>",
    right = "<S-l>",
    down = "<S-j>",
    up = "<S-k>",
    line_left = "<S-h>",
    line_right = "<S-l>",
    line_down = "<S-j>",
    line_up = "<S-k>",
  },
}

-- M.indentscope = {
--   symbol = "┋",
-- }

M.ai = {}

M.visits = {
  store = {
    path = vim.fn.stdpath "cache" .. "mini-visits-index",
  },
}

local miniclue = require "mini.clue"
M.clue = {
  triggers = {
    { mode = "n", keys = "<Leader>" },
    { mode = "x", keys = "<Leader>" },

    { mode = "i", keys = "<C-x>" },

    { mode = "n", keys = "g" },
    { mode = "x", keys = "g" },

    { mode = "n", keys = "'" },
    { mode = "n", keys = "`" },
    { mode = "x", keys = "'" },
    { mode = "x", keys = "`" },

    { mode = "n", keys = '"' },
    { mode = "x", keys = '"' },
    { mode = "i", keys = "<C-r>" },
    { mode = "c", keys = "<C-r>" },

    { mode = "n", keys = "<C-w>" },

    { mode = "n", keys = "z" },
    { mode = "x", keys = "z" },
  },

  clues = {
    miniclue.gen_clues.builtin_completion(),
    miniclue.gen_clues.g(),
    miniclue.gen_clues.marks(),
    miniclue.gen_clues.registers(),
    miniclue.gen_clues.windows(),
    miniclue.gen_clues.z(),
  },
}

M.notify = {
  window = {
    winblend = vim.g.winblend,
  },
}

M.git = {}

M.diff = {
  view = {
    style = "sign",
    signs = { add = " ", change = " ", delete = "" },
  },
}

local starter = require "mini.starter"

M.starter = {
  evaluate_single = false,
  header = table.concat({
    " 𝙔𝘼𝙔!ーーーーー",
    " ☆  *    .      ☆",
    "     . ∧＿∧    ∩    * ☆",
    "*  ☆ ( ・∀・)/ .",
    "  .  ⊂         ノ* ☆",
    "  ☆ * (つ ノ  .☆",
    "       (ノ",
  }, "\n"),
  footer = os.date(),
  items = {
    {
      name = "   Bookmarked Files",
      action = "lua MiniExtra.pickers.visit_paths { filter = 'todo' }",
      section = " Actions ", -- Nerd Font terminal icon for Actions section
    },
    {
      name = "   Lazy Update",
      action = ":Lazy update",
      section = " Actions ",
    },
    {
      name = "   Open Blank File",
      action = ":enew",
      section = " Actions ",
    },
    {
      name = "   Find Files",
      action = "lua MiniPick.builtin.files()",
      section = " Actions ",
    },
    {
      name = "   Recent Files",
      action = "lua MiniExtra.pickers.oldfiles()",
      section = " Actions ",
    },
    {
      name = "   Quit",
      action = ":q!",
      section = " Actions ",
    },
  },
  content_hooks = {
    starter.gen_hook.aligning("center", "center"),
  },
}

M.icons = {
  lsp = {
    ["function"] = { glyph = "󰡱", hl = "MiniIconsCyan" },
  },
}

M.operators = {}
M.animate = {}

return M
