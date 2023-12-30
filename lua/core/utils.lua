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

M.lazy_load = function(plugin)
  vim.api.nvim_create_autocmd({ "BufRead", "BufWinEnter", "BufNewFile" }, {
    group = vim.api.nvim_create_augroup("BeLazyOnFileOpen" .. plugin, {}),
    callback = function()
      local file = vim.fn.expand "%"
      local condition = file ~= "[lazy]" and file ~= ""

      if condition then
        vim.api.nvim_del_augroup_by_name("BeLazyOnFileOpen" .. plugin)

        if plugin ~= "treesitter" then
          vim.schedule(function()
            require("lazy").load { plugins = plugin }

            if plugin == "lspconfig" then
              vim.cmd "silent! do FileType"
            end
          end, 0)
        else
          require("lazy").load { plugins = plugin }
        end
      end
    end,
  })
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
    vim.opt.signcolumn = "yes:4"
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
  local command = vim.fn.input "Enter a command: "
  local shell = vim.o.shell
  vim.cmd("vsplit term://" .. shell)
  vim.fn.termopen(shell)

  local terminal_win = vim.api.nvim_get_current_win()
  vim.api.nvim_win_set_option(terminal_win, "number", false) -- Remove line numbers
  vim.api.nvim_win_set_option(terminal_win, "relativenumber", false) -- Remove line numbers
  vim.api.nvim_win_set_option(terminal_win, "winbar", "") -- Remove dropbar

  vim.api.nvim_chan_send(vim.b.terminal_job_id, command .. "\n")
  vim.api.nvim_feedkeys("i", "n", true)
end

return M
