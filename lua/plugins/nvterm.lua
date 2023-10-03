local binder = require("config.binder")
local spec = {
  "NvChad/nvterm",
  name = "nvterm",
  keys = {
    "<A-t>",
    "<A-T>",
    "<A-h>",
    "<A-H>",
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

  local binder = binder.new():with_modes({ "n", "t" })
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
end

return spec
