local lspconfig = require "lspconfig"

lspconfig.rust_analyzer.setup {
  filetypes = { "rust" },
  cmd = { "rustup", "run", "stable", "rust-analyzer" },
}

lspconfig.clangd.setup {
  filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
  single_file_support = true,
}

lspconfig.lua_ls.setup {
  filetypes = { "lua" },
  settings = {
    Lua = {
      completion = {
        callSnippet = "Replace",
      },
      diagnostics = {
        globals = { "vim" },
      },
      -- format = { enable = false },
    },
  },
}

lspconfig.bashls.setup {
  single_file_support = true,
}

lspconfig.gopls.setup {
  cmd = { "gopls" },
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  single_file_support = true,
}
