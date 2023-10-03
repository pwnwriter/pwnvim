local binder = require("config.binder")
local icon = require("config.icons")

vim.diagnostic.config({
  severity_sort = true,
  virtual_text = false,
  float = {
    source = true,
    scope = "cursor",
    header = "",
    prefix = " " .. icon.kind.Event .. " ",
    suffix = " ",
  },
})

vim.fn.sign_define("DiagnosticSignError")
vim.fn.sign_define("DiagnosticSignWarn")
vim.fn.sign_define("DiagnosticSignInfo")
vim.fn.sign_define("DiagnosticSignHint")

binder:with_modes("n")
binder:bind("[g", vim.diagnostic.goto_prev, { float = false })
binder:bind("]g", vim.diagnostic.goto_next, { float = false })
binder:bind("<leader>g", vim.diagnostic.open_float)
