local binder = require("config.binder").new()

local spec = {
  "NvChad/nvterm",
  name = "nvterm",
  keys = {
    "<A-t>",
    "<A-h>",
    "<A-H>",
    "<A-R>",
  },
}

function spec:config()
  local nvterm = require("nvterm")
  nvterm.setup({
    terminals = {
      shell = vim.o.shell,
      list = {},
      type_opts = {
        float = {
          relative = "editor",
          row = 0.3,
          col = 0.25,
          width = 0.50,
          height = 0.50,
          border = "single",
        },
      },
    },
  })

  binder:with_modes({ "n", "t" })
  local terminal = require("nvterm.terminal")
  binder:bind("<A-t>", function()
    terminal.toggle("float")
  end)
  binder:bind("<A-h>", function()
    terminal.toggle("horizontal")
  end)
  binder:bind("<A-H>", function()
    terminal.toggle("vertical")
  end)

  local function run_command(cmd)
    if cmd then
      terminal.send("clear && " .. cmd, "vertical")
    else
      print("No command defined for filetype: " .. vim.bo.filetype)
    end
  end

  binder:bind("<A-R>", function()
    local ft_cmds = {
      rust = "cargo run -q",
      sh = "bash " .. vim.fn.expand("%"),
      python = "python3 " .. vim.fn.expand("%"),
    }
    local cmd = ft_cmds[vim.bo.filetype]
    run_command(cmd)
  end)
end

return spec
