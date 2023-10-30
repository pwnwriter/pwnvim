-- Global mappings.
vim.keymap.set("n", "<space>e", vim.diagnostic.open_float)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(ev)
    vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

    local opts = { buffer = ev.buf }
    vim.keymap.set("n", "<leader>ih", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "<leader>id", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "<leader>it", vim.lsp.buf.type_definition, opts)
    vim.keymap.set("n", "<leader>ii", vim.lsp.buf.implementation, opts)
    vim.keymap.set("n", "<leader>ir", vim.lsp.buf.references, opts)
    vim.keymap.set({ "n", "v" }, "<leader>ia", vim.lsp.buf.code_action, opts)
    vim.keymap.set("n", "<leader>if", vim.lsp.buf.format, opts)
    vim.keymap.set("n", "<leader>ic", vim.lsp.buf.rename, opts)
    vim.keymap.set({ "i", "s" }, "<c-space>", vim.lsp.buf.signature_help, opts)
  end,
})

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
-- Setup language servers.
local lspconfig = require "lspconfig"

lspconfig.lua_ls.setup {
  capabilities = capabilities,
  settings = {
    Lua = {
      diagnostics = { globals = { "vim" } },
    },
  },
}

lspconfig.rust_analyzer.setup {
  filetypes = { "rust" },
  cmd = { "rustup", "run", "stable", "rust-analyzer" },
}

