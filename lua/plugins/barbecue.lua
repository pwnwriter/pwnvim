local icons = require("config.icons")

local spec = {
  "utilyre/barbecue.nvim",
  name = "barbecue",
  dependencies = {
    "SmiteshP/nvim-navic",
    "nvim-tree/nvim-web-devicons",
  },
  event = {
    "BufReadPre",
    "BufNewFile",
  },
}

function spec:config()
  local barbecue = require("barbecue")

  barbecue.setup({
    show_modified = true,
    kinds = icons.kind,
    symbols = {
      separator = icons.widget.nesting,
    },
  })
end

return spec
