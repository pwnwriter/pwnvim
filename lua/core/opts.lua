local icons = require "core.icons"

local opt = vim.opt
local g = vim.g

local M = {}

M.initial = function()
  g.mapleader = " "
  opt.clipboard = "unnamedplus"
  opt.wildmenu = true
  opt.termguicolors = true
  opt.laststatus = 0
  opt.list = true
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
  opt.complete = {}
  opt.expandtab = true
  opt.swapfile = false
  opt.undofile = true
end

M.final = function()
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
  opt.laststatus = 0
  opt.sidescrolloff = 2
  local statusline_ascii = ""
  opt.statusline = "%#Normal#" .. statusline_ascii .. "%="
end

local is_windows = vim.uv.os_uname().sysname == "Windows_NT"
vim.env.PATH = vim.env.PATH .. (is_windows and ";" or ":") .. vim.fn.stdpath "data" .. "/mason/bin"

return M
