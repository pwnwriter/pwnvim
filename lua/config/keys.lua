local binder = require("config.binder").new()

-- i mode bindings
binder:with_modes { "i" }
binder:with_desc("Navigate left"):bind("<C-h>", "<Left>")
binder:with_desc("Navigate down"):bind("<C-j>", "<Down>")
binder:with_desc("Navigate up"):bind("<C-k>", "<Up>")
binder:with_desc("Navigate right"):bind("<C-l>", "<Right>")
binder:with_desc("Quickly exit insert mode"):bind("jj", "<esc>")

-- n mode bindings
local cmds = { "nu!", "rnu!", "nonu!" }
local current_index = 1
local function toggle_numbering()
  current_index = current_index % #cmds + 1
  vim.cmd("set " .. cmds[current_index])
end
binder:with_modes { "n" }
binder:with_desc("Toggle line/relative number/no number"):bind("<leader>n", toggle_numbering)
binder:with_desc("Clear search highlight"):bind("<leader>ch", "<cmd>nohlsearch<CR>")
binder:with_desc("Move to the left window"):bind("<C-h>", "<C-w>h")
binder:with_desc("Move to the bottom window"):bind("<C-j>", "<C-w>j")
binder:with_desc("Move to the top window"):bind("<C-k>", "<C-w>k")
binder:with_desc("Move to the right window"):bind("<C-l>", "<C-w>l")
binder:with_desc("Save the current file"):bind("<C-s>", "<cmd>w<CR>")
binder:with_desc("Switch to the next buffer"):bind("<Tab>", "<cmd>bnext<CR>")
binder:with_desc("Switch to the previous buffer"):bind("<s-Tab>", "<cmd>bprev<CR>")

-- x mode bindings
binder:with_modes { "x" }
binder:with_desc("Paste and replace selected text"):bind("p", "_dP")

return binder
