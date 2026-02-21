return {
  "catppuccin/nvim",
  lazy = true,
  priority = 1000,
  -- enabled = false,
  name = "catppuccin",
  init = function()
    vim.cmd.colorscheme "catppuccin"
  end,
  opts = {
    custom_highlights = function(C)
      return {
        MiniFilesTitle        = {
          fg = C.base,
          bg = C.flamingo,
          style = { "bold" }
        },
        MiniFilesTitleFocused = {
          bg = C.Rosewater,
          fg = C.base,
          style = { "bold", "bold" },
        }
      }
    end,
    background = { light = "latte", dark = "mocha" },
    float = {
      transparent = true,
      solid = true,
    },
    transparent_background = true,
    compile_path = vim.fn.stdpath "cache" .. "/catppuccin",
    compile = true,
    integrations = {
      snacks = {
        enabled = true,
        indent_scope_color = "lavender",
      },
      treesitter = true,
      blink_cmp = true,
      mini = {
        enabled = true,
      },
    },

  },
}
