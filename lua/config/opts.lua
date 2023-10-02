local icons = require("config.icons")
local opt = vim.opt

opt.clipboard = "unnamedplus"
vim.g.mapleader = " "
opt.wildmenu = true

opt.swapfile = false
opt.undofile = true

opt.timeout = false
opt.updatetime = 400

opt.termguicolors = true
opt.confirm = false
opt.equalalways = false
opt.splitbelow = true
opt.splitright = true
opt.scrolloff = 2
opt.sidescrolloff = 2
opt.shortmess:append("aIF")

opt.list = true
opt.listchars = { tab = icons.layout.tab .. "  " }
opt.fillchars:append({ eob = " " })

opt.laststatus = 0
local statusline_ascii = "⊱ ────── {⋆⌘⋆} ────── ⊰"
vim.opt.statusline = "%#Normal#" .. statusline_ascii .. "%="

opt.ruler = true
-- opt.colorcolumn = "+1"
opt.number = true
opt.relativenumber = true
opt.breakindent = true
opt.cursorlineopt:append("number", "screenline")

opt.linebreak = true
opt.showbreak = icons.layout.wrap .. " "

opt.ignorecase = true
opt.smartcase = true

opt.pumheight = 20
opt.complete = {}

opt.expandtab = true
opt.tabstop = 4
opt.shiftwidth = 4

opt.spell = false
opt.spelllang:append("programming")
opt.spelloptions:append("camel")

-- add binaries installed by mason.nvim to path
local is_windows = vim.loop.os_uname().sysname == "Windows_NT"
vim.env.PATH = vim.env.PATH .. (is_windows and ";" or ":") .. vim.fn.stdpath("data") .. "/mason/bin"
