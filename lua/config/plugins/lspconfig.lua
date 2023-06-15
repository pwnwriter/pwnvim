local Binder = require("config.Binder")
local icons = require("config.icons")

local spec = {
  "neovim/nvim-lspconfig",
  name = "lspconfig",
  event = {
    "BufReadPre",
    "BufNewFile",
  },
}

function spec:init()
  vim.diagnostic.config({
    severity_sort = true,
    virtual_text = {
      spacing = 2,
      prefix = " " .. icons.layout.list,
      suffix = " ",
    },
    float = {
      source = true,
      border = "rounded",
      header = "",
      prefix = " " .. icons.layout.list .. " ",
      suffix = " ",
    },
  })

  vim.fn.sign_define("DiagnosticSignError", { linehl = "DiagnosticLineError" })
  vim.fn.sign_define("DiagnosticSignWarn", { linehl = "DiagnosticLineWarn" })
  vim.fn.sign_define("DiagnosticSignInfo", { linehl = "DiagnosticLineInfo" })
  vim.fn.sign_define("DiagnosticSignHint", { linehl = "DiagnosticLineHint" })

  local binder = Binder.new():with_modes({ "n" })
  binder:bind("[d", vim.diagnostic.goto_prev, { float = false })
  binder:bind("]d", vim.diagnostic.goto_next, { float = false })
  binder:bind("<leader>d", vim.diagnostic.open_float)
end

function spec:config()
  local lspconfig = require("lspconfig")
  local windows = require("lspconfig.ui.windows")
  local cmp = require("cmp_nvim_lsp")

  windows.default_options.border = "rounded"
  lspconfig.util.on_setup = lspconfig.util.add_hook_after(
    lspconfig.util.on_setup,
    function(config)
      config.capabilities = vim.tbl_deep_extend(
        "force",
        config.capabilities,
        cmp.default_capabilities()
      )

      config.handlers["textDocument/hover"] =
        vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
      config.handlers["textDocument/signatureHelp"] =
        vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })
    end
  )

  local servers_path =
    vim.fs.normalize(vim.fn.stdpath("config") .. "/settings/servers.lua")
  if vim.loop.fs_access(servers_path, "R") then dofile(servers_path) end

  vim.api.nvim_create_autocmd({ "LspAttach" }, {
    group = vim.api.nvim_create_augroup("config.plugins.lsp.attacher", {}),
    callback = function(args)
      local binder = Binder.new():with_modes({ "n" }):with_buffer(args.buf)
      binder:bind("<leader>ih", vim.lsp.buf.hover)
      binder:bind("<leader>id", vim.lsp.buf.definition, { reuse_win = true })
      binder:bind("<leader>it", vim.lsp.buf.type_definition, {
        reuse_win = true,
      })
      binder:bind("<leader>ii", vim.lsp.buf.implementation)
      binder:bind("<leader>ir", vim.lsp.buf.references)
      binder:bind("<leader>ia", vim.lsp.buf.code_action)
      binder:bind("<leader>if", vim.lsp.buf.format, { async = true })
      binder:bind("<leader>ic", vim.lsp.buf.rename)
      binder
        :clone()
        :with_modes({ "i", "s" })
        :bind("<c-space>", vim.lsp.buf.signature_help)
    end,
  })

  vim.api.nvim_create_autocmd({ "LspDetach" }, {
    group = vim.api.nvim_create_augroup("config.plugins.lsp.detacher", {}),
    callback = function(args)
      local binder = Binder.new():with_modes({ "n" }):with_buffer(args.buf)
      binder:unbind("<leader>ih")
      binder:unbind("<leader>id")
      binder:unbind("<leader>it")
      binder:unbind("<leader>ii")
      binder:unbind("<leader>ir")
      binder:unbind("<leader>ia")
      binder:unbind("<leader>if")
      binder:unbind("<leader>ic")
    end,
  })
end

return spec
