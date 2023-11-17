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

return M
