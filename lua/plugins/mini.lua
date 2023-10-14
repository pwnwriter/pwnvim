local spec = {
  "echasnovski/mini.nvim",
  name = "mini",
  version = false,
  event = { "UiEnter" },
  keys = { "<leader>e", "<leader>ff", "<leader>b", "<leader>fr", "<leader>fw", "<leader>q" },
}

function spec:config()
  local miniOpts = require "config.mini-opts"
  require("mini.pairs").setup(miniOpts.pairs)
  require("mini.surround").setup(miniOpts.surround)
  require("mini.comment").setup { comment = "gc", comment_line = "gcc", textobject = "gc" }
  require("mini.files").setup(miniOpts.files)
  require("mini.hipatterns").setup(miniOpts.hipatterns)
  require("mini.bufremove").setup(miniOpts.bufremove)
  require("mini.pick").setup(miniOpts.pick)
end

return spec
