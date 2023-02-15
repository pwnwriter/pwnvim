-- Define a function to set the statusline
function set_statusline()
  local filename = vim.fn.expand('%:t')
  local filetype = vim.bo.filetype
  local icon = get_filetype_icon(filetype)
  local statusline = '%#StatusLine# ' .. icon .. ' %#StatusLineNC# ' .. filename .. ' %=' .. icon .. ' ' .. filetype .. ' %#StatusLine# %f %#StatusLineNC#'
  vim.wo.statusline = statusline
end

-- Get the icon for a file type
function get_filetype_icon(filetype)
  local icons = {
  ['typescript']         = ' ' ,
  ['python']             = ' ' ,
  ['java']               = ' ' ,
  ['html']               = ' ' ,
  ['css']                = ' ' ,
  ['scss']               = ' ' ,
  ['javascript']         = ' ' ,
  ['javascriptreact']    = ' ' ,
  ['markdown']           = ' ' ,
  ['sh']                 = ' ',
  ['zsh']                = ' ',
  ['vim']                = ' ',
  ['rust']               = ' ',
  ['cpp']                = ' ',
  ['c']                  = ' ',
  ['go']                 = ' ',
  ['lua']                = ' ',
  ['conf']               = ' ',
  ['haskel']             = ' ',
  ['ruby']               = ' ',
  ['txt']                = ' ',
  }
  return icons[filetype] or ''
end

-- Set the statusline for all windows
set_statusline()

-- Define the colors for the statusline
vim.cmd('highlight StatusLine guibg=#5C5F5E guifg=#EBDBB2')
vim.cmd('highlight StatusLineNC guibg=#5C5F5E guifg=#928374')
vim.cmd('autocmd BufEnter * lua set_statusline()')

