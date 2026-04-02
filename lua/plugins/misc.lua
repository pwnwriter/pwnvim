vim.pack.add({
  { src = "https://github.com/nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
  { src = "https://github.com/OXY2DEV/markview.nvim" },
  { src = "https://github.com/Bekaboo/dropbar.nvim" },
})

local ok, ts = pcall(require, "nvim-treesitter.configs")
if ok then
  ---@diagnostic disable-next-line: missing-fields
  ts.setup({
    ensure_installed = { "lua", "vimdoc", "rust", "go", "astro", "json", "toml", "markdown" },
    highlight = {
      enable = true,
      use_languagetree = true,
    },
    indent = { enable = true },
  })
end

local ok2, mv = pcall(require, "markview")
if ok2 then
  mv.setup({
    preview = {
      icon_provider = "mini",
    },
  })
end

local map = require("mappings").map
map("n", "<leader>p", function()
  require("dropbar.api").pick(vim.v.count ~= 0 and vim.v.count or nil)
end, "Toggle dropbar menu")
