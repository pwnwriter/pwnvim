local M = {}

M.lazy = function(lazy_path)
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

--- Toggle line numbers
local cmds = { "nu!", "rnu!", "nonu!" }
local current_index = 1
function M.toggle_numbering()
  current_index = current_index % #cmds + 1
  vim.cmd("set " .. cmds[current_index])
end

--- Toggle inlay hints
function M.toggle_inlay_hint()
  local is_enabled = vim.lsp.inlay_hint.is_enabled()
  vim.lsp.inlay_hint.enable(0, not is_enabled)
end

--- Toggle dropbar
function M.toggle_dropbar()
  if vim.o.winbar == "" then
    vim.o.winbar = "%{%v:lua.dropbar.get_dropbar_str()%}"
  else
    vim.o.winbar = ""
  end
end

-- Toggle flow state mode, Disable most of the unnecessary plugins :oOc
local state = 0
function M.toggle_flow()
  if state == 0 then
    vim.o.relativenumber = false
    vim.o.number = false
    vim.opt.signcolumn = "yes:9"
    vim.o.winbar = ""
    require("gitsigns").detach()
    state = 1
  else
    vim.o.relativenumber = true
    vim.o.number = true
    vim.opt.signcolumn = "auto"
    vim.o.winbar = "%{%v:lua.dropbar.get_dropbar_str()%}"
    require("gitsigns").attach()
    state = 0
  end
end

function M.mousepad()
  vim.cmd [[amenu 10.100 mousemenu.Toggle\ flow\ state <cmd> lua require("core.utils").toggle_flow()<CR>]]
  vim.cmd [[amenu 10.110 mousemenu.Goto\ defination <cmd> lua vim.lsp.buf.definition()<CR>]]
  vim.cmd [[amenu 10.120 mousemenu.Code\ action <cmd> lua vim.lsp.buf.code_action()<CR>]]
end

function M.run_vert_command()
  local shell = vim.o.shell
  local command = vim.fn.input "Enter a command: "

  vim.cmd("vsplit term://" .. shell)

  local terminal_win = vim.api.nvim_get_current_win() -- Get the terminal win
  vim.api.nvim_win_set_option(terminal_win, "number", false) -- Remove line numbers
  vim.api.nvim_win_set_option(terminal_win, "relativenumber", false) -- Remove line numbers
  vim.api.nvim_win_set_option(terminal_win, "winbar", "") -- Remove dropbar

  vim.api.nvim_chan_send(vim.b.terminal_job_id, command .. "\n")
  vim.api.nvim_feedkeys("i", "n", true)
end

-- Autocommands
function M.autocmds()
  local autocmd = vim.api.nvim_create_autocmd

  autocmd("RecordingEnter", {
    callback = function()
      local msg = string.format("Key:  %s", vim.fn.reg_recording())
      vim.notify(msg, vim.log.levels.INFO, {
        title = "Recording started",
      })
    end,
  })

  autocmd("RecordingLeave", {
    callback = function()
      local msg = string.format("Key:  %s", vim.fn.reg_recording())
      vim.notify(msg, vim.log.levels.INFO, {
        title = "Recording stopped",
      })
    end,
  })

  vim.b.miniindentscope_disable = true
  autocmd("TermOpen", {
    desc = "Disable 'mini.indentscope' in terminal buffer",
    callback = function(data)
      vim.b[data.buf].miniindentscope_disable = true
    end,
  })
end

return M
