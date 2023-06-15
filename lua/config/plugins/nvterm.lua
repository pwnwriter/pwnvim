local Binder = require("config.Binder")
local spec = {
  "NvChad/nvterm",
  name = "nvterm",
  keys = {
    "<A-t>",
    "<A-h>",
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
          relative = 'editor',
          row = 0.3,
          col = 0.20,
          width = 0.5,
          height = 0.4,
          border = "single",
        },
        horizontal = { location = "rightbelow", split_ratio = .3, },
        vertical = { location = "rightbelow", split_ratio = .5 },
      }
    },
    behavior = {
      autoclose_on_quit = {
        enabled = false,
        confirm = true,
      },
      close_on_exit = true,
      auto_insert = true,
    },
  })

  local binder = Binder.new():with_modes({ "n", "t" })
  local terminal = require("nvterm.terminal")
  binder:bind("<A-t>", function() terminal.toggle "float" end)
  binder:bind("<A-h>", function() terminal.toggle "horizontal" end)
end


return spec

