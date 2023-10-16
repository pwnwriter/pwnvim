local spec = {
  "echasnovski/mini.nvim",
  name = "mini",
  version = false,
  event = {
    "BufReadPre",
    "BufNewFile",
  },
  keys = { "<leader>e", "<leader>ff", "<leader>b", "<leader>fr", "<leader>fw", "<leader>q" },
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
}

function spec:config()
  local mini_opts = require "config.mini-opts"
  local mini_modules = { "pairs", "surround", "comment", "files", "hipatterns", "bufremove", "pick", "move","indentscope"}

  for _, module in ipairs(mini_modules) do
    require("mini." .. module).setup(mini_opts[module])
  end
end

return spec
