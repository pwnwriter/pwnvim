local lspconfig = require "lspconfig"

lspconfig.rust_analyzer.setup {
  filetypes = { "rust" },
  cmd = { "rustup", "run", "stable", "rust-analyzer" },
}

lspconfig.clangd.setup {
  filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
  -- root_dir:root_pattern(
  --     '.clangd',
  --     '.clang-tidy',
  --     '.clang-format',
  --     'compile_commands.json',
  --     'compile_flags.txt',
  --     'configure.ac',
  --     '.git'
  -- ),
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
