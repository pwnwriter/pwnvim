local cmp = require "cmp"
local icons = require "mini.icons"

cmp.setup {
  snippet = {
    expand = function(opts)
      vim.snippet.expand(opts.body)
    end,
  },
  experimental = {
    ghost_text = true,
  },
  window = {
    completion = {
      scrolloff = vim.go.scrolloff,
      border = "rounded",
    },
    documentation = {
      border = "rounded",
    },
  },
  formatting = {
    fields = { "kind", "abbr", "menu" },
    format = function(_, item)
      local kind = item.kind
      item.kind = icons.get("lsp", kind)
      item.menu = kind:gsub("(%l)(%u)", "%1 %2"):lower()
      return item
    end,
  },
  sources = {
    { name = "async_path", max_item_count = 10 },
    {
      name = "nvim_lsp",
      max_item_count = 80,
    },
    {
      name = "buffer",
      max_item_count = 20,
      option = {
        get_bufnrs = function()
          return vim.tbl_map(function(win)
            return vim.api.nvim_win_get_buf(win)
          end, vim.api.nvim_list_wins())
        end,
      },
    },
  },
  mapping = {
    ["<c-space>"] = cmp.mapping(function()
      if not cmp.visible() then
        cmp.complete()
      end
      cmp.abort()
    end, { "i", "s" }),
    ["<c-y>"] = cmp.mapping(function(fallback)
      if not cmp.visible() then
        fallback()
      end
      cmp.scroll_docs(-1)
    end, { "i", "s" }),
    ["<c-e>"] = cmp.mapping(function(fallback)
      if not cmp.visible() then
        fallback()
      end
      cmp.scroll_docs(1)
    end, { "i", "s" }),
    ["<c-p>"] = cmp.mapping(function(fallback)
      if not cmp.visible() then
        fallback()
      end
      cmp.select_prev_item()
    end, { "i", "s" }),
    ["<c-n>"] = cmp.mapping(function(fallback)
      if not cmp.visible() then
        fallback()
      end
      cmp.select_next_item()
    end, { "i", "s" }),
    ["<cr>"] = cmp.mapping(function(fallback)
      if cmp.get_selected_entry() == nil then
        fallback()
      end
      cmp.confirm()
    end, { "i", "s" }),
  },
}
