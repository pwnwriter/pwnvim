local spec = {
  "NvChad/nvterm",
  priority = 10000,
  event = { "VeryLazy" },
  keys = {

},

  config = function()
    local nvterm = require("nvterm")
    nvterm.setup()
  end
}

return spec

