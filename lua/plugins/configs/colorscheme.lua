local utils = require "catppuccin.utils.colors"

local options = {
  compile_path = vim.fn.stdpath "cache" .. "/catppuccin",
  compile = true,
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
    dropbar = {
      enabled = true,
      color_mode = false,
    },
    noice = true,
    notify = true,
    native_lsp = {
      enabled = true,
      inlay_hints = {
        background = true,
      },
    },
    mini = {
      enabled = true,
      indentscope_color = "lavender",
    },
  },
}
return options
