local icons = require("config.icons")

local options = {
  opt = {
    clipboard = "unnamedplus",
    wildmenu = true,
    undofile = true,
    mouse = "",
    timeout = false,
    updatetime = 400,
    termguicolors = true,
    confirm = false,
    equalalways = false,
    splitbelow = true,
    splitright = true,
    scrolloff = 2,
    sidescrolloff = 2,
    shortmess = { a = true, I = true, F = true },
    list = true,
    listchars = { tab = icons.layout.tab .. "  " },
    fillchars = { eob = " " },
    laststatus = 0,
    colorcolumn = "+1",
    number = true,
    relativenumber = true,
    linebreak = true,
    showbreak = icons.layout.wrap .. " ",
    incsearch = true,
    ignorecase = true,
    smartcase = true,
    pumheight = 20,
    complete = {},
    expandtab = true,
    tabstop = 4,
    shiftwidth = 4,
    spell = true,
    spelllang = { "programming" },
    spelloptions = { "camel" }
  },
  g = {
    mapleader = " ",
    guifont = vim.g.neovide and { "JetBrainsMono Nerd Font", "h6" },
    neovide_scale_factor = vim.g.neovide and 0.8,
  }
}

for scope, table in pairs(options) do
  for setting, value in pairs(table) do
    vim[scope][setting] = value
  end
end

