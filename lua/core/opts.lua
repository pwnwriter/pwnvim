local icons = require "core.icons"

local opt = vim.opt
local g = vim.g

local M = {}

M.initial = function()
  g.mapleader = " "
  opt.laststatus = 0
  opt.clipboard = "unnamedplus"
  opt.termguicolors = true
  opt.listchars = { tab = icons.layout.tab .. "  " }
  opt.fillchars:append { eob = " " }
  opt.shortmess:append "aIF"
  opt.cursorline = true
  opt.cursorlineopt = "number"
  opt.ruler = true
  opt.number = true
  opt.relativenumber = true
  opt.breakindent = true
  opt.linebreak = true
  opt.showbreak = icons.layout.wrap .. " "
  opt.expandtab = true
  opt.swapfile = false
  opt.undofile = true
end

M.final = function()
  opt.complete = {}
  opt.list = true
  opt.wildmenu = true
  opt.pumheight = 20
  opt.ignorecase = true
  opt.smartcase = true
  opt.timeout = false
  opt.updatetime = 400
  opt.confirm = false
  opt.equalalways = false
  opt.splitbelow = true
  opt.splitright = true
  opt.scrolloff = 2
  opt.sidescrolloff = 2
  local statusline_ascii = ""
  opt.statusline = "%#Normal#" .. statusline_ascii .. "%="
end

--- load shada after ui-enter
local shada = vim.o.shada
vim.o.shada = ""
vim.api.nvim_create_autocmd("User", {
  pattern = "VeryLazy",
  callback = function()
    vim.o.shada = shada
    pcall(vim.cmd.rshada, { bang = true })
  end,
})

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
