local M = {}

local cmds = { "nu!", "rnu!", "nonu!" }
local current_index = 1

function M.toggle_numbering()
  current_index = current_index % #cmds + 1
  vim.cmd("set " .. cmds[current_index])
  local signcolumn_setting = "auto"
  if cmds[current_index] == "nonu!" then
    signcolumn_setting = "yes:4"
  end
  vim.opt.signcolumn = signcolumn_setting
end

--- Toggle inlay hints
function M.toggle_inlay_hint()
  local is_enabled = vim.lsp.inlay_hint.is_enabled()
  vim.lsp.inlay_hint.enable(not is_enabled)
end

-- Toggle flow state mode, Disable most of the unnecessary plugins :oOc
local state = 0
function M.toggle_flow()
  if state == 0 then
    vim.o.relativenumber = false
    vim.o.number = false
    vim.opt.signcolumn = "yes:4"
    vim.o.winbar = ""
    state = 1
  else
    vim.o.relativenumber = true
    vim.o.number = true
    vim.opt.signcolumn = "auto"
    vim.o.winbar = "%{%v:lua.dropbar.get_dropbar_str()%}"
    state = 0
  end
end

-- Autocommands
function M.autocmds()
  local autocmd = vim.api.nvim_create_autocmd

  vim.b.miniindentscope_disable = true
  autocmd("TermOpen", {
    desc = "Disable 'mini.indentscope' in terminal buffer",
    callback = function(data)
      vim.b[data.buf].miniindentscope_disable = true
    end,
  })
end

return M
