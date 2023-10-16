vim.loader.enable()

-- Clipboard and key mappings
local icons = require "config.icons"
local opt = vim.opt

opt.clipboard = "unnamedplus"
vim.g.mapleader = " "
opt.wildmenu = true

-- File-related options
opt.swapfile = false
opt.undofile = true

-- Performance and appearance options
opt.timeout = false
opt.updatetime = 400
opt.termguicolors = true
opt.confirm = false
opt.equalalways = false
opt.splitbelow = true
opt.splitright = true
opt.scrolloff = 2
opt.sidescrolloff = 2
opt.shortmess:append "aIF"

-- line number highlighting
opt.cursorline = true
opt.cursorlineopt = "number"

-- Display options
opt.list = true
opt.listchars = { tab = icons.layout.tab .. "  " }
opt.fillchars:append { eob = " " }
--
-- statusline
opt.laststatus = 1
local statusline_ascii = ""
vim.opt.statusline = "%#Normal#" .. statusline_ascii .. "%="

opt.ruler = true
opt.number = true
opt.relativenumber = true
opt.breakindent = true

-- Text and search options
opt.linebreak = true
opt.showbreak = icons.layout.wrap .. " "
opt.ignorecase = true
opt.smartcase = true

-- Completion options
opt.pumheight = 20
opt.complete = {}

-- Indentation and formatting options
opt.expandtab = true
opt.tabstop = 4
opt.shiftwidth = 4

-- Add binaries installed by mason.nvim to the PATH
local is_windows = vim.loop.os_uname().sysname == "Windows_NT"
vim.env.PATH = vim.env.PATH .. (is_windows and ";" or ":") .. vim.fn.stdpath "data" .. "/mason/bin"

-- Load shada after UI-enter
local shada = vim.o.shada
vim.o.shada = ""
vim.api.nvim_create_autocmd("User", {
  pattern = "VeryLazy",
  callback = function()
    vim.o.shada = shada
    pcall(vim.api.nvim_exec2, "rshada", {})
  end,
})
