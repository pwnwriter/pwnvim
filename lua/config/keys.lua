local binder = require("config.binder")

local binder = binder.new()

-- Navigation keys in insert mode
binder:with_modes({ "i" })
binder:with_desc("Navigate left in insert mode")
binder:bind("<C-h>", "<Left>")
binder:with_desc("Navigate down in insert mode")
binder:bind("<C-j>", "<Down>")
binder:with_desc("Navigate up in insert mode")
binder:bind("<C-k>", "<Up>")
binder:with_desc("Navigate right in insert mode")
binder:bind("<C-l>", "<Right>")


-- Muscle memory for me
binder:with_modes({ "i" })
binder:with_desc("Quickly exit insert mode")
binder:bind("jj", "<esc>")
binder:with_modes({ "n" })
binder:with_desc("Move the current line down and keep cursor position")
binder:bind("J", "jzz")
binder:with_desc("Move the current line up and keep cursor position")
binder:bind("K", "kzz")
binder:with_desc("Clear search highlight")
binder:bind("<leader>h", "<cmd>nohlsearch<CR>")
binder:with_desc("Toggle line number")
binder:bind("<leader>n", "<cmd> set nu! <CR>")
binder:with_desc("Toggle relative number")
binder:bind("<leader>rn", "<cmd> set rnu! <CR>")

binder:with_modes({ "v" })
binder:with_desc("Move down")
binder:bind("j", 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', "Move down", { expr = true })

binder:with_modes({ "v" })
binder:with_desc("Move up")
binder:bind("k", 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', "Move up", { expr = true })



-- Preserve original clipboard when pasting selected words.
binder:with_modes({ "x" })
binder:with_desc("Paste and replace selected text")
binder:bind("p", "_dP")

binder:with_modes({ "v" })
binder:with_desc("Move the selected text down")
binder:bind("J", ":m '>+1<CR>gv=gv")
binder:with_desc("Move the selected text up")
binder:bind("K", ":m '<-2<CR>gv=gv")

-- Window splitting
binder:with_modes({ "n" })
binder:with_desc("Move to the left window")
binder:bind("<C-h>", "<C-w>h")
binder:with_desc("Move to the bottom window")
binder:bind("<C-j>", "<C-w>j")
binder:with_desc("Move to the top window")
binder:bind("<C-k>", "<C-w>k")
binder:with_desc("Move to the right window")
binder:bind("<C-l>", "<C-w>l")
binder:with_desc("Close the current window")
binder:bind("<leader>x", "<C-w>c")
binder:with_desc("Save the current file")
binder:bind("<C-s>", "<cmd>w <CR>")
binder:with_desc("Close the current buffer")
binder:bind("<C-q>", "<cmd>bd!<CR>")
binder:with_desc("Switch to the next buffer")
binder:bind("<Tab>", "<cmd>bnext<CR>")
binder:with_desc("Switch to the previous buffer")
binder:bind("<s-Tab>", "<cmd>bprev<CR>")

binder:with_modes({ "n" })
binder:with_desc("Show LSP information")
binder:bind("<leader>lp", "<cmd>LspInfo<CR>")
binder:with_desc("Restart the LSP server")
binder:bind("<leader>lr", "<cmd>LspRestart<CR>")
binder:with_desc("Start the LSP server")
binder:bind("<leader>ls", "<cmd>LspStart<CR>")
