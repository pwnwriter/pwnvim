local lspconfig = require "lspconfig"

lspconfig.rust_analyzer.setup {}

lspconfig.lua_ls.setup {
  filetypes = { "lua" },
  settings = {
    Lua = {
      runtime = {
        version = "LuaJIT",
      },
      completion = {
        callSnippet = "Replace",
      },
      diagnostics = {
        globals = { "vim" },
      },
      -- format = { enable = false },
      hint = {
        enable = true,
      },
    },
  },
}

lspconfig.bashls.setup {}

lspconfig.gopls.setup {}

lspconfig.pylsp.setup {
  settings = {
    pylsp = {
      plugins = {
        jedi_completion = {
          include_params = true,
        },
      },
    },
  },
}

lspconfig.tsserver.setup {
  cmd = { "typescript-language-server", "--stdio" },
  filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
  init_options = {
    hostInfo = "neovim",
  },
  single_file_support = true,
}

lspconfig.gleam.setup {}

lspconfig.nil_ls.setup {}

lspconfig.zls.setup {}
