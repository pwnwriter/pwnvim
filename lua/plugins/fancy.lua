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
