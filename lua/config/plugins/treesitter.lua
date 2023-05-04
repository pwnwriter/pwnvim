local spec = {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdateSync",
  cmd = { "TSUpdateSync" },
  event = { "BufReadPre", "BufNewFile" },
}

function spec:config()
  local treesitter = require("nvim-treesitter.configs")

  treesitter.setup({
    highlight = {
      enable = true,
    },
    indent = {
      enable = true,
    },
  })
end

return spec
