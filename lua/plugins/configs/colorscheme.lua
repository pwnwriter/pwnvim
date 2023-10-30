local utils = require "catppuccin.utils.colors"

local options = {
  compile_path = vim.fn.stdpath "cache" .. "/catppuccin",
  compile = true,
  flavour = "macchiato",
  transparent = true,
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
      indentscope_color = "lavender",
    },
  },
}
return options
