local vim_loader = require "vim.loader"
local icons = require "core.icons"

local opt = vim.opt
local g = vim.g

local M = {}

M.initial = function()
  vim_loader.enable()
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
end

M.final = function()
  opt.swapfile = false
  opt.pumheight = 20
  opt.ignorecase = true
  opt.smartcase = true
  opt.undofile = true
  opt.timeout = false
  opt.updatetime = 400
  opt.confirm = false
  opt.equalalways = false
  opt.splitbelow = true
  opt.splitright = true
  opt.scrolloff = 2
  opt.laststatus = 0
  local statusline_ascii = ""
  opt.statusline = "%#Normal#" .. statusline_ascii .. "%="
  opt.sidescrolloff = 2
end

local is_windows = vim.loop.os_uname().sysname == "Windows_NT"
vim.env.PATH = vim.env.PATH .. (is_windows and ";" or ":") .. vim.fn.stdpath "data" .. "/mason/bin"

return M
