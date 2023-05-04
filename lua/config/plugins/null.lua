local spec = {
  "jose-elias-alvarez/null-ls.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
}

function spec:config()
  local null = require("null-ls")

  local sources_path =
    vim.fs.normalize(vim.fn.stdpath("config") .. "/settings/sources.lua")
  if vim.loop.fs_access(sources_path, "R") then dofile(sources_path) end

  null.setup({
    border = "rounded",
  })
end

return spec
