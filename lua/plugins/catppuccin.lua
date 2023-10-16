local spec = {
  "catppuccin/nvim",
  lazy = false,
  name = "catppuccin",
  priority = 1000,
}

function spec:config()
  local catppuccin = require "catppuccin"
  local utils = require "catppuccin.utils.colors"

  catppuccin.setup {
    flavour = "macchiato",
    custom_highlights = function(palette)
      return {
        ["DiagnosticLineError"] = {
          bg = utils.darken(palette.red, 0.095, palette.base),
        },
        ["DiagnosticLineWarn"] = {
          bg = utils.darken(palette.yellow, 0.095, palette.base),
        },
        ["DiagnosticLineInfo"] = {
          bg = utils.darken(palette.sky, 0.095, palette.base),
        },
        ["DiagnosticLineHint"] = {
          bg = utils.darken(palette.teal, 0.095, palette.base),
        },

        ["CmpItemMenu"] = {
          fg = palette.overlay0,
        },
      }
    end,
    integrations = {
      cmp = true,
      treesitter = true,
      mason = true,
      harpoon = true,
      noice = true,
      notify = true,
      barbecue = {
        bold_basename = false,
        dim_context = true,
      },
      mini = {
        enabled = true,
        indentscope_color = "",
      },
      indent_blankline = {
        enabled = true,
        scope_color = "",
        colored_indent_levels = false,
      },
    },
  }

  catppuccin.load()
end

return spec
