local icons = require("config.icons")

vim.opt.clipboard = "unnamedplus"
vim.g.mapleader = " "
vim.opt.wildmenu = true


if vim.g.neovide then
  vim.opt.guifont = { "JetBrainsMono Nerd Font", "h6" }
  vim.g.neovide_scale_factor = 0.8
end


vim.opt.undofile = true

vim.opt.timeout = false
vim.opt.updatetime = 400

vim.opt.termguicolors = true
vim.opt.confirm = false
vim.opt.equalalways = false
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.scrolloff = 2
vim.opt.sidescrolloff = 2
vim.opt.shortmess = {
  a = true,
  I = true,
  F = true,
}

vim.opt.list = true
vim.opt.listchars = { tab = icons.layout.tab .. "  " }
vim.opt.fillchars:append({ eob = " " })

vim.opt.laststatus = 0
vim.opt.colorcolumn = "+1"
vim.opt.number = true
vim.opt.relativenumber = true

-- vim.opt.cursorline = true
vim.opt.linebreak = true
vim.opt.showbreak = icons.layout.wrap .. " "

vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.pumheight = 20
vim.opt.complete = {}

vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

vim.opt.spell = true
vim.opt.spelllang:append({ "programming" })
vim.opt.spelloptions:append({ "camel" })


