vim.pack.add({
  { src = "https://github.com/saghen/blink.cmp", version = "v1.10.1" },
  { src = "https://github.com/rafamadriz/friendly-snippets" },
})

local ok, blink = pcall(require, "blink.cmp")
if not ok then return end

blink.setup({
  keymap = { preset = "enter" },
  sources = {
    default = { "lazydev", "lsp", "path", "snippets", "buffer" },
    providers = {
      cmdline = {
        min_keyword_length = 2,
      },
      lazydev = {
        name = "LazyDev",
        module = "lazydev.integrations.blink",
        score_offset = 100,
      },
    },
  },
  completion = {
    menu = {
      border = vim.g.border_style,
      scrolloff = 1,
      scrollbar = false,
    },
    documentation = {
      auto_show_delay_ms = 0,
      auto_show = true,
      window = {
        border = vim.g.border_style,
      },
    },
  },
})
