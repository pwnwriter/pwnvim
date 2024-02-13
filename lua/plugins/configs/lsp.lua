local lspconfig = require "lspconfig"
local windows = require "lspconfig.ui.windows"
local cmp = require "cmp_nvim_lsp"

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
