local M = {}

M.pairs = {
  mappings = {
    ["<"] = { action = "closeopen", pair = "<>", neigh_pattern = "[^\\].", register = { cr = false } },
  },
}

M.surround = {}

M.files = {
  windows = { preview = false, width_focus = 25, width_preview = 40, height_focus = 20, border = "solid" },
  use_as_default_explorer = true,
  mappings = {
    close = "<leader>e",
  },
}

M.hipatterns = {}

M.bufremove = {
  silent = true,
}

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

M.indentscope = {
  symbol = "┋",
}

vim.b.miniindentscope_disable = true

vim.api.nvim_create_autocmd("TermOpen", {
  desc = "Disable 'mini.indentscope' in terminal buffer",
  callback = function(data)
    vim.b[data.buf].miniindentscope_disable = true
  end,
})

M.completion = {
  window = {
    info = { border = "rounded" },
    signature = { border = "rounded" },
  },
}

M.ai = {}

M.visits = {
  store = {
    path = vim.fn.stdpath "cache" .. "mini-visits-index",
  },
}

local miniclue = require "mini.clue"
M.clue = {
  triggers = {
    -- Leader triggers
    { mode = "n", keys = "<Leader>" },
    { mode = "x", keys = "<Leader>" },

    -- Built-in completion
    { mode = "i", keys = "<C-x>" },

    -- `g` key
    { mode = "n", keys = "g" },
    { mode = "x", keys = "g" },

    -- Marks
    { mode = "n", keys = "'" },
    { mode = "n", keys = "`" },
    { mode = "x", keys = "'" },
    { mode = "x", keys = "`" },

    -- Registers
    { mode = "n", keys = '"' },
    { mode = "x", keys = '"' },
    { mode = "i", keys = "<C-r>" },
    { mode = "c", keys = "<C-r>" },

    -- Window commands
    { mode = "n", keys = "<C-w>" },

    -- `z` key
    { mode = "n", keys = "z" },
    { mode = "x", keys = "z" },
  },

  clues = {
    -- Enhance this by adding descriptions for <Leader> mapping groups
    miniclue.gen_clues.builtin_completion(),
    miniclue.gen_clues.g(),
    miniclue.gen_clues.marks(),
    miniclue.gen_clues.registers(),
    miniclue.gen_clues.windows(),
    miniclue.gen_clues.z(),
  },
}

return M
