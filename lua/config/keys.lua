local Binder = require("config.Binder")

local binder = Binder.new()

-- Navigation keys in insert mode
binder:with_modes { "i" }
binder:bind("<C-h>", "<Left>")
binder:bind("<C-j>", "<Down>")
binder:bind("<C-k>", "<Up>")
binder:bind("<C-l>", "<Right>")


-- Muscle memory for me
binder:with_modes { "i" }
binder:bind("jj", "<esc>")
binder:with_modes { "n" }
binder:bind("J", "jzz")
binder:bind("K", "kzz")

binder:with_modes { "v" }
binder:bind("J", ":m '>+1<CR>gv=gv")
binder:bind("K", ":m '<-2<CR>gv=gv")

-- Window splitting
binder:with_modes { "n" }
binder:bind("<leader>v", ":vsplit<CR>")
binder:bind("<leader>h", ":split<CR>")
binder:bind("<C-h>", "<C-w>h")
binder:bind("<C-j>", "<C-w>j")
binder:bind("<C-k>", "<C-w>k")
binder:bind("<C-l>", "<C-w>l")
binder:bind("<leader>x", "<C-w>c")
-- binder:bind("<C-C>", ":%y+<CR>")
binder:bind("<C-s>", ":w <CR>")
binder:bind("<C-q>", ":bd!<CR>")

binder:with_modes { "n" }
binder:bind("<leader>lp", ":LspInfo<CR>")
