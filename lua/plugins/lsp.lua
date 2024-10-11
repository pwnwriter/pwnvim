local capabilities = vim.lsp.protocol.make_client_capabilities()

capabilities.textDocument.completion.completionItem = {
  documentationFormat = { "markdown", "plaintext" },
  snippetSupport = true,
  preselectSupport = true,
  insertReplaceSupport = true,
  labelDetailsSupport = true,
  deprecatedSupport = true,
  commitCharactersSupport = true,
  tagSupport = { valueSet = { 1 } },
  resolveSupport = {
    properties = {
      "documentation",
      "detail",
      "additionalTextEdits",
    },
  },
}

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
      format = {
        defaultConfig = {
        },
      },
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

lspconfig.ts_ls.setup {
  cmd = { "typescript-language-server", "--stdio" },
  filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
  init_options = {
    hostInfo = "neovim",
  },
  single_file_support = true,
  settings = {
    completions = {
      completeFunctionCalls = true,
    },
  },
}

lspconfig.gleam.setup {}

lspconfig.nil_ls.setup {}

lspconfig.zls.setup {}
