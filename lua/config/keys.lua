local binder = require("config.binder").new()

-- Navigation keys in insert mode
binder:with_modes { "i" }
binder:with_desc "Navigate left in insert mode"
binder:bind("<C-h>", "<Left>")
binder:with_desc "Navigate down in insert mode"
binder:bind("<C-j>", "<Down>")
binder:with_desc "Navigate up in insert mode"
binder:bind("<C-k>", "<Up>")
binder:with_desc "Navigate right in insert mode"
binder:bind("<C-l>", "<Right>")

-- Muscle memory for me
binder:with_modes { "i" }
binder:with_desc "Quickly exit insert mode"
binder:bind("jj", "<esc>")
binder:with_modes { "n" }
binder:with_desc "Clear search highlight"
binder:bind("<leader>ch", "<cmd>nohlsearch<CR>")

----xx toggle between 'nu', 'rnu', and no numbers xx-------------
local cmds = { "nu!", "rnu!", "nonu!" }
local current_index = 1

local function toggle_numbering()
  current_index = current_index % #cmds + 1
  local cmd = cmds[current_index]
  vim.cmd("set " .. cmd)
end

binder:with_desc "Toggle line/relative number/no number"
binder:bind("<leader>n", toggle_numbering)

-- Preserve original clipboard when pasting selected words.
binder:with_modes { "x" }
binder:with_desc "Paste and replace selected text"
binder:bind("p", "_dP")

-- Window splitting
binder:with_modes { "n" }
binder:with_desc "Move to the left window"
binder:bind("<C-h>", "<C-w>h")
binder:with_desc "Move to the bottom window"
binder:bind("<C-j>", "<C-w>j")
binder:with_desc "Move to the top window"
binder:bind("<C-k>", "<C-w>k")
binder:with_desc "Move to the right window"
binder:bind("<C-l>", "<C-w>l")

binder:with_desc "Close the current window"
binder:bind("<leader>x", "<C-w>c")
binder:with_desc "Save the current file"
binder:bind("<C-s>", "<cmd>w <CR>")
binder:with_desc "Switch to the next buffer"
binder:bind("<Tab>", "<cmd>bnext<CR>")
binder:with_desc "Switch to the previous buffer"
binder:bind("<s-Tab>", "<cmd>bprev<CR>")
