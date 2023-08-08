-- settings/servers.lua
local lspconfig = require("lspconfig")

lspconfig.rust_analyzer.setup({
	capabilities = capabilities,
	filetypes = { "rust" },
	cmd = { "rustup", "run", "stable", "rust-analyzer" },
})

-- lspconfig.clangd.setup({
--     capabilities = capabilities,
-- })
--
-- lspconfig.lua_ls.setup({
--     capabilities = capabilities,
--     filetypes = { "lua" },
--     -- single_file_support = true,
-- })
--
-- lspconfig.bashls.setup({
--     capabilities = capabilities,
-- })
--
-- lspconfig.zls.setup({
--     capabilities = capabilities,
--     single_file_support = true,
--     filetypes = { "zig", "zir" },
-- })
--
-- lspconfig.tsserver.setup({
--     cmd = { "typescript-language-server", "--stdio" },
-- })
