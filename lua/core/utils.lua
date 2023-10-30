local M = {}

M.lazy = function(lazy_path)
  vim.fn.system {
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazy_path,
  }

  vim.opt.rtp:prepend(lazy_path)
  return M
end

M.lazy_load = function(plugin)
  vim.api.nvim_create_autocmd({ "BufRead", "BufWinEnter", "BufNewFile" }, {
    group = vim.api.nvim_create_augroup("BeLazyOnFileOpen" .. plugin, {}),
    callback = function()
      local file = vim.fn.expand "%"
      local condition = file ~= "NvimTree_1" and file ~= "[lazy]" and file ~= ""

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

local cmds = { "nu!", "rnu!", "nonu!" }
local current_index = 1

function M.toggle_numbering()
  current_index = current_index % #cmds + 1
  vim.cmd("set " .. cmds[current_index])
end

function M.run_command()
  local terminal = require "nvterm.terminal"
  local ft_cmds = {
    rust = "cargo run",
    sh = "bash " .. vim.fn.expand "%",
    python = "python3 " .. vim.fn.expand "%",
    lua = "lua " .. vim.fn.expand "%",
  }
  local command = ft_cmds[vim.bo.filetype]

  if command then
    terminal.send("clear && " .. command, "vertical")
  else
    print("No command defined for filetype: " .. vim.bo.filetype)
  end
end

vim.api.nvim_create_autocmd("TermOpen", {
  desc = "Disable 'mini.indentscope' in terminal buffer",
  callback = function(data)
    vim.b[data.buf].miniindentscope_disable = true
  end,
})

return M
