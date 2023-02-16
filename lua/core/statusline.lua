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
