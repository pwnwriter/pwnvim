local options = {
  compile_path = vim.fn.stdpath "cache" .. "/catppuccin",
  compile = true,
  flavour = "mocha",
  custom_highlights = function(palette)
    return {
      ["CmpItemMenu"] = {
        fg = palette.overlay0,
      },
    }
  end,
  integrations = {
    cmp = true,
    treesitter = true,
    mason = true,
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
