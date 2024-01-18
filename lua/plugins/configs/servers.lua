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

lspconfig.bashls.setup {
  single_file_support = true,
}

lspconfig.gopls.setup {
  cmd = { "gopls" },
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  single_file_support = true,
}

lspconfig.pylsp.setup {
  cmd = { "pylsp" },
  filetypes = { "python" },
  single_file_support = true,
}

lspconfig.tsserver.setup {
  cmd = { "typescript-language-server", "--stdio" },
  filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
  init_options = {
    hostInfo = "neovim",
  },
  single_file_support = true,
}

lspconfig.ocamllsp.setup {}

lspconfig.nil_ls.setup {
  cmd = { "nil" },
  filetypes = { "nix" },
  root_pattern = { "flake.nix", ".git" },
  single_file_support = true,
}
