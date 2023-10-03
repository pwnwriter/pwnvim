local lspconfig = require("lspconfig")

lspconfig.rust_analyzer.setup({
  capabilities = capabilities,
  filetypes = { "rust" },
  cmd = { "rustup", "run", "stable", "rust-analyzer" },
})

lspconfig.lua_ls.setup({
  capabilities = capabilities,
  filetypes = { "lua" },
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
    },
  },
})
