local icons = require "core.icons"

local M = {}

M.treesitter = {
  ensure_installed = { "lua", "vimdoc", "rust", "go" },
  highlight = {
    enable = true,
    use_languagetree = true,
  },

  indent = { enable = true },
}

M.gitsigns = {
  signs = {
    add = { text = "" .. icons.gitsigns.add },
    change = { text = "" .. icons.gitsigns.change },
    delete = { text = "" .. icons.gitsigns.delete },
    topdelete = { text = "" .. icons.gitsigns.topdelete },
    changedelete = { text = "" .. icons.gitsigns.changedelete },
    untracked = { text = "" .. icons.gitsigns.untracked },
  },
  on_attach = function()
    require("core.mappings").gitsigns()
  end,
}

vim.diagnostic.config {
  virtual_text = {
    prefix = "",
    suffix = "",
    format = function(diagnostic)
      return "" .. icons.diagnostics.message .. diagnostic.message .. " "
    end,
  },
  underline = {
    severity = { min = vim.diagnostic.severity.WARN },
  },
  signs = {
    text = {
      [vim.diagnostic.severity.HINT] = icons.diagnostics.hint,
      [vim.diagnostic.severity.ERROR] = icons.diagnostics.error,
      [vim.diagnostic.severity.INFO] = icons.diagnostics.info,
      [vim.diagnostic.severity.WARN] = icons.diagnostics.warn,
    },
  },
}

return M
