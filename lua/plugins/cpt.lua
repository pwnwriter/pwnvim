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
    background = { light = "latte", dark = "mocha" },
    float = {
      transparent = true,   -- Enables transparency for floating windows
      solid = true,        -- If true, uses a solid background for floats
    },
    transparent_background = true,
    compile_path = vim.fn.stdpath "cache" .. "/catppuccin",
    compile = true,
    styles = {
      comments = { "italic" },
      functions = { "bold" },
      keywords = { "italic" },
      operators = { "bold" },
      conditionals = { "bold" },
      loops = { "bold" },
      booleans = { "bold", "italic" },
    },
    integrations = {
      snacks = {
        enabled = true,
        indent_scope_color = "lavender",
      },
      treesitter = true,
      mason = true,
      blink_cmp = true,
      native_lsp = {
        enabled = true,
        virtual_text = {
          errors = { "italic" },
          hints = { "italic" },
          warnings = { "italic" },
          information = { "italic" },
        },
        underlines = {
          errors = { "undercurl" },
          hints = { "undercurl" },
          warnings = { "undercurl" },
          information = { "undercurl" },
        },
      },
      mini = {
        enabled = true,
      },
    },

  },
}
