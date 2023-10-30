local lspconfig = require "lspconfig"
local windows = require "lspconfig.ui.windows"
local cmp = require "cmp_nvim_lsp"

local map = function(mode, lhs, rhs, options)
  vim.keymap.set(mode, lhs, rhs, options)
end

windows.default_options.border = "rounded"
lspconfig.util.on_setup = lspconfig.util.add_hook_after(lspconfig.util.on_setup, function(config)
  config.capabilities = vim.tbl_deep_extend("force", config.capabilities, cmp.default_capabilities())

  config.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
  config.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })
end)

local servers_path = vim.fs.normalize(vim.fn.stdpath "config" .. "/lua/plugins/configs/servers.lua")
if vim.loop.fs_access(servers_path, "R") then
  dofile(servers_path)
end

map("n", "<space>d", vim.diagnostic.open_float)
map("n", "[d", vim.diagnostic.goto_prev)
map("n", "]d", vim.diagnostic.goto_next)
map("n", "<space>q", vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(ev)
    vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

    local opts = { buffer = ev.buf }
    map("n", "<leader>ih", vim.lsp.buf.hover, opts)
    map("n", "<leader>id", vim.lsp.buf.definition, opts)
    map("n", "<leader>it", vim.lsp.buf.type_definition, opts)
    map("n", "<leader>ii", vim.lsp.buf.implementation, opts)
    map("n", "<leader>ir", vim.lsp.buf.references, opts)
    map({ "n", "v" }, "<leader>ia", vim.lsp.buf.code_action, opts)
    map("n", "<leader>if", vim.lsp.buf.format, opts)
    map("n", "<leader>ic", vim.lsp.buf.rename, opts)
    map({ "i", "s" }, "<c-space>", vim.lsp.buf.signature_help, opts)
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
