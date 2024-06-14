local M = {}

M.bootstrap = function(lazy_path)
  vim.fn.system {
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazy_path,
  }
  vim.opt.rtp:prepend(lazy_path)
end

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
    state = 1
  else
    vim.o.relativenumber = true
    vim.o.number = true
    vim.opt.signcolumn = "auto"
    state = 0
  end
end

function M.run_vert_command(command)
  if not command then
    command = vim.fn.input "Enter a command: "
  end

  vim.cmd("vsplit term://" .. vim.o.shell)

  local terminal_win = vim.api.nvim_get_current_win() -- Get the terminal win

  -- Remove line numbers and dropbar
  vim.api.nvim_win_set_option(terminal_win, "number", false)
  vim.api.nvim_win_set_option(terminal_win, "relativenumber", false)
  vim.api.nvim_win_set_option(terminal_win, "winbar", "")

  vim.api.nvim_chan_send(vim.b.terminal_job_id, command .. "\n")
  vim.api.nvim_feedkeys("i", "n", true)
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
