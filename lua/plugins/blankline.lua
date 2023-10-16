local binder = require("config.binder").new()

local spec = {
  "lukas-reineke/indent-blankline.nvim",
  name = "blank",
  main = "ibl",
  event = {
    "BufReadPre",
    "BufNewFile",
  },
}

function spec:config()
  local blankline = require "ibl"
  blankline.setup {}
end

return spec
