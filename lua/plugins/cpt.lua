vim.pack.add({ { src = "https://github.com/catppuccin/nvim" } })

local ok, catppuccin = pcall(require, "catppuccin")
if not ok then return end

catppuccin.setup({
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
  custom_highlights = function(C)
    return {
      MiniFilesTitle        = { fg = C.base, bg = C.flamingo, style = { "bold" } },
      MiniFilesTitleFocused = { bg = C.rosewater, fg = C.base, style = { "bold", "bold" } },
    }
  end,
})

vim.cmd.colorscheme "catppuccin"
