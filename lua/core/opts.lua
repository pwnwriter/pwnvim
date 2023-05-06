vim.g.mapleader = " " -- remap \ (leader) to space
local icons = require("core.icons")
vim.opt.listchars = {
  tab = icons.layout.tab .. "  ",
}
vim.opt.showbreak = icons.layout.wrap .. " "

vim.opt.undofile = true

-- opt -> Normal option
-- wopt -> Window options
-- bopt -> Buffer options

local opt = function(option, value)
    if type(vim.o[option]) == "boolean" then
        vim.o[option] = value
    else
        vim.o[option] = tostring(value)
    end
end

local wopt = function(option, value)
    if type(vim.wo[option]) == "boolean" then
        vim.wo[option] = value
    else
        vim.wo[option] = tostring(value)
    end
end

local bopt = function(option, value)
    if type(vim.bo[option]) == "boolean" then
        vim.bo[option] = value
    else
        vim.bo[option] = tostring(value)
    end
end

-- Set global options
vim.cmd("filetype plugin indent on")
opt("shortmess", vim.o.shortmess .. "c")
opt("pumheight", 0)
opt("fileencoding", "utf-8")
opt("cmdheight", 1)
opt("whichwrap", "b,s,<,>,[,[,h,l")
opt("splitbelow", true)
opt("splitright", true)
opt("termguicolors", true)
opt("conceallevel", 0)
opt("showtabline", 2)
opt("showmode", false)
opt("backup", false)
opt("writebackup", false)
opt("updatetime", 300)
opt("timeoutlen", 100)
opt("clipboard", "unnamedplus")
opt("hlsearch", false)
opt("ignorecase", true)
opt("scrolloff", 3)
opt("sidescrolloff", 5)
opt("mouse", "a")

-- Set window options
wopt("wrap", false)
wopt("number", true)
opt("relativenumber", true)
wopt("signcolumn", "yes")

-- Set buffer options
opt("tabstop", 2)
opt("softtabstop", 2)
bopt("tabstop", 2)
opt("shiftwidth", 2)
bopt("shiftwidth", 2)
opt("autoindent", true)
bopt("autoindent", true)
opt("expandtab", true)
bopt("expandtab", true)

