local Binder = require("config.Binder")
local spec = {
  "NvChad/nvterm",
  name = "nvterm",
  keys = {
    "<A-t>",
    "<A-h>",
    "<A-H>",
  },
}

function spec:config()
  local nvterm = require("nvterm")
  nvterm.setup({})

  local binder = Binder.new():with_modes({ "n", "t" })
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
