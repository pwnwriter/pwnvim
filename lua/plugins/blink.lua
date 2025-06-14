return
{
  "saghen/blink.cmp",
  version = '*',
  event = { "LspAttach" },
  dependencies = {
    "rafamadriz/friendly-snippets",
  },
  opts = {
    keymap = { preset = 'enter' },
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
        -- draw = {
        --   treesitter = { 'lsp' },
        -- }
      },
      documentation = {
        auto_show_delay_ms = 0,
        auto_show = true,
        window = {
          border = vim.g.border_style,
        },
      },
    },
  },
}
