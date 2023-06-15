-- settings/servers.lua
local lspconfig = require("lspconfig")

-- $ rustup component add rust-analyzer
lspconfig.rust_analyzer.setup({
  capabilities = capabilities,
  cmd = { "rustup", "run", "stable", "rust-analyzer" },
})


lspconfig.clangd.setup({
  capabilities = capabilities
})


lspconfig.lua_ls.setup({
  capabilities = capabilities
})
