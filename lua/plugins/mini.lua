vim.pack.add({ { src = "https://github.com/nvim-mini/mini.nvim" } })
require("mini.icons").mock_nvim_web_devicons()
local mini_config = {}

mini_config.pairs = {
  mappings = {
    ["<"] = {
      action = "closeopen",
      pair = "<>",
      neigh_pattern = "[^\\].",
      register = { cr = false },
    },
  },
}

mini_config.files = {
  use_as_default_explorer = true,
  windows = {
    max_number = math.huge,
    preview = false,
    width_focus = 30,
    width_nofocus = 20,
    width_preview = 25,
  },
}

local hipatterns = require("mini.hipatterns")
mini_config.hipatterns = {
  highlighters = {
    fixme = { pattern = "%f[%w]()FIXME()%f[%W]", group = "MiniHipatternsFixme" },
    hack = { pattern = "%f[%w]()HACK()%f[%W]", group = "MiniHipatternsHack" },
    todo = { pattern = "%f[%w]()TODO()%f[%W]", group = "MiniHipatternsTodo" },
    note = { pattern = "%f[%w]()NOTE()%f[%W]", group = "MiniHipatternsNote" },
    hex_color = hipatterns.gen_highlighter.hex_color(),
  },
}

mini_config.bufremove = {
  silent = true,
}

mini_config.comment = {}

mini_config.pick = {
  options = {
    use_cache = true,
  },
}

mini_config.move = {
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

mini_config.ai = {}

mini_config.visits = {
  store = {
    path = vim.fn.stdpath("cache") .. "mini-visits-index",
  },
}

local miniclue = require("mini.clue")
mini_config.clue = {
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

mini_config.git = {}

mini_config.diff = {
  view = {
    style = "sign",
    signs = {
      add = " ",
      change = " ",
      delete = "",
    },
  },
}

mini_config.starter = {
  evaluate_single = false,

  header = table.concat({
    "                                   ",
    "            ╔════════╗             ",
    "            ║  p w n ║             ",
    "            ╚════════╝             ",
    "          > build. exploit. repeat.",
    "                                   ",
  }, "\n"),

  footer = "cwd: " .. vim.fn.fnamemodify(vim.fn.getcwd(), ":t"),

  items = {
    {
      name = "    Find files",
      action = "lua MiniPick.builtin.files()",
      section = "    start ",
    },
    {
      name = "    Recent",
      action = "lua MiniExtra.pickers.oldfiles()",
      section = "    start ",
    },
    {
      name = "    Nvim config",
      action = "edit $MYVIMRC",
      section = "    start ",
    },
    {
      name = "    Projects",
      action = "lua MiniPick.builtin.grep_live()",
      section = "    work ",
    },
    {
      name = "  󰗼  Quit",
      action = "qa",
      section = "    exit ",
    },
  },

  content_hooks = {
    require("mini.starter").gen_hook.aligning("center", "center"),
  },
}

mini_config.icons = {
  lsp = {
    ["function"] = { glyph = "󰡱", hl = "MiniIconsCyan" },
  },
}

mini_config.operators = {}

local mini_modules = {
  "icons",
  "comment",
  "pairs",
  "ai",
  "surround",
  "files",
  "hipatterns",
  "bufremove",
  "pick",
  "move",
  "extra",
  "visits",
  "clue",
  "git",
  "diff",
  "operators",
  "starter",
}

for _, module in ipairs(mini_modules) do
  require("mini." .. module).setup(mini_config[module] or {})
end

require("mappings").mini()
