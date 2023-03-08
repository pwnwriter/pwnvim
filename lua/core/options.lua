local set_option = function(option, value)
    if type(vim.o[option]) == 'boolean' then
        vim.o[option] = value
    else
        vim.o[option] = tostring(value)
    end
end

local set_buffer_option = function(option, value)
    if type(vim.bo[option]) == 'boolean' then
        vim.bo[option] = value
    else
        vim.bo[option] = tostring(value)
    end
end

local set_window_option = function(option, value)
    if type(vim.wo[option]) == 'boolean' then
        vim.wo[option] = value
    else
        vim.wo[option] = tostring(value)
    end
end

vim.cmd('filetype plugin indent on')
set_option('shortmess', vim.o.shortmess .. 'c')
set_option('pumheight', 0)
set_option('fileencoding', 'utf-8')
set_option('cmdheight', 1)
set_option('whichwrap', 'b,s,<,>,[,[,h,l')
set_option('splitbelow', true)
set_option('splitright', true)
set_option('termguicolors', true)
set_option('conceallevel', 0)
set_option('showtabline', 2)
set_option('showmode', false)
set_option('backup', false)
set_option('writebackup', false)
set_option('updatetime', 300)
set_option('timeoutlen', 100)
set_option('clipboard', "unnamedplus")
set_option('hlsearch', false)
set_option('ignorecase', true)
set_option('scrolloff', 3)
set_option('sidescrolloff', 5)
set_option('mouse', "a")
set_window_option('wrap', false)
set_window_option('number', true)
set_option('relativenumber', true)
set_window_option('signcolumn', "yes")
set_option('tabstop', 2)
set_option('softtabstop', 2)
set_buffer_option('tabstop', 2)
set_option('shiftwidth', 2)
set_buffer_option('shiftwidth', 2)
set_option('autoindent', true)
set_buffer_option('autoindent', true)
set_option('expandtab', true)
set_buffer_option('expandtab', true)
