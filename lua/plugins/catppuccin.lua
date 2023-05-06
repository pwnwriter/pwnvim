local spec = {
  "catppuccin/nvim",
  name = "catppuccin.nvim",
  priority = 10000,
}

function spec:config()
  local catppuccin = require("catppuccin")

  catppuccin.setup({
    flavour = "mocha",
    custom_highlights = function(colors)
      return {
        ["CmpItemMenu"] = {
          fg = colors.overlay0,
        },
      }
    end,
    integrations = {
      barbecue = {
        bold_basename = false,
        dim_context = true,
      },
    },
  })

  catppuccin.load()
end

return spec
