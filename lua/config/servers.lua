local lspconfig = require("lspconfig")

lspconfig.rust_analyzer.setup({
    filetypes = { "rust" },
    cmd = { "rustup", "run", "stable", "rust-analyzer" },
})

lspconfig.lua_ls.setup({
    filetypes = { "lua" },
    settings = {
        Lua = {
            completion = {
                callSnippet = "Replace"
            },
            diagnostics = {
                globals = { "vim" },
            },
            format = { enable = false },
        },
    },
})
