vim.g.mapleader = " "

local map = function(mode, lhs, rhs, opts)
    local options = { noremap = true, silent = true }
    if opts then options = vim.tbl_extend('force', options, opts) end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Navigation keys in insert mode
map('i', '<C-h>', '<Left>')
map('i', '<C-j>', '<Down>')
map('i', '<C-k>', '<Up>')
map('i', '<C-l>', '<Right>')

-- Other mappings
map('n', '<TAB>', ':BufferLineCycleNext<CR>')
map('n', '<S-TAB>', ':BufferLineCyclePrev<CR>')
map('n', '<C-a>', ':NvimTreeToggle<CR>')
map('n', '<leader>ff', ':Telescope find_files <CR>')
map('n', '<A-t>', ':ToggleTerm <CR>')
map('n', '<C-s>', ':w <CR>')

map('n', '<C-q>', ':bd!<CR>')


