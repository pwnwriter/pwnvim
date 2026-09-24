vim.pack.add({ { src = "https://codeberg.org/evergarden/nvim.git", name = "evergarden" } })

require('evergarden').setup({
  theme = {
    variant = vim.o.background == "light" and "summer" or "fall",
    accent = 'green',
  },
  integrations = {
    blink_cmp = true,
    mini = {
      enable = true,
      animate = true,
      clue = true,
      completion = true,
      cursorword = true,
      deps = true,
      diff = true,
      files = true,
      hipatterns = true,
      icons = true,
      indentscope = true,
      jump = true,
      jump2d = true,
      map = true,
      notify = true,
      operators = true,
      pick = true,
      starters = true,
      statusline = true,
      surround = true,
      tabline = true,
      test = true,
      trailspace = true,
    },

  },
  editor = {
    transparent_background = true,
    sign = { color = 'none' },
    float = {
      color = 'none',
      solid_border = true,
    },
    completion = {
      color = 'none',
    },
  },
})

vim.cmd.colorscheme "evergarden"
