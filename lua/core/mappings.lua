local Binder = require("core.binder")

-- Navigation keys in insert mode
Binder.new({"i"}):bind("<C-h>", "<Left>")
Binder.new({"i"}):bind("<C-j>", "<Down>")
Binder.new({"i"}):bind("<C-k>", "<Up>")
Binder.new({"i"}):bind("<C-l>", "<Right>")

-- Normal mode other keys
Binder.new({"n"}):bind("<C-s>", ":w <CR>")
Binder.new({"n"}):bind("<C-q>", ":bd!<CR>")

-- Bufferline
Binder.new({"n"}):bind("<TAB>", ":BufferLineCycleNext<CR>")
Binder.new({"n"}):bind("<S-TAB>", ":BufferLineCyclePrev<CR>")

-- Nvim tree
Binder.new({"n"}):bind("<leader>a", ":NvimTreeToggle<CR>")

-- Telescope
--Binder.new({"n"}):bind("<leader>F", ":Telescope find_files <CR>")
--Binder.new({"n"}):bind("<leader>fl", ":Telescope live_grep <CR>")
--Binder.new({"n"}):bind("<leader>th", ":Telescope colorscheme  <CR>")
--Binder.new({"n"}):bind("<leader>tb", ":Telescope buffers<CR>")

-- muscle memory for me
Binder.new({"i"}):bind("jj", "<esc>")
Binder.new({"n"}):bind("J", "jzz")
Binder.new({"n"}):bind("K", "kzz")


-- Window splitting
Binder.new({"n"}):bind("<leader>v", ":vsplit<CR>")
Binder.new({"n"}):bind("<leader>h", ":split<CR>")
Binder.new({"n"}):bind("<C-h>", "<C-w>h")
Binder.new({"n"}):bind("<C-j>", "<C-w>j")
Binder.new({"n"}):bind("<C-k>", "<C-w>k")
Binder.new({"n"}):bind("<C-l>", "<C-w>l")
Binder.new({"n"}):bind("<leader>x", "<C-w>c")

-- nvterm (terminal)
Binder.new({"n"}):bind("<A-t>", ':lua require("nvterm.terminal").toggle "float"<CR>')
Binder.new({"t"}):bind("<A-t>", '<C-\\><C-n><cmd>lua require("nvterm.terminal").toggle "float"<CR>')
Binder.new({"n"}):bind("<A-h>", ':lua require("nvterm.terminal").toggle "horizontal"<CR>')
Binder.new({"t"}):bind("<A-h>", '<C-\\><C-n><cmd>lua require("nvterm.terminal").toggle "horizontal"<CR>')
Binder.new({"n"}):bind("<A-H>", ':lua require("nvterm.terminal").toggle "vertical"<CR>')
Binder.new({"t"}):bind("<A-H>", '<C-\\><C-n><cmd>lua require("nvterm.terminal").toggle "vertical"<CR>')

-- Extras
Binder.new({"n"}):bind("<C-c>", ":%y+<CR>")

