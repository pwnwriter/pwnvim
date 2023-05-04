local Binder = require("config.binder")
local icons = require("config.icons")

local spec = {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPre", "BufWritePre" },
}

function spec:config()
  local gitsigns = require("gitsigns")

  gitsigns.setup({
    current_line_blame = true,
    current_line_blame_formatter = "  <author>, <author_time:%R> "
      .. icons.layout.list
      .. " <summary> ",
    current_line_blame_formatter_nc = "  <author> ",
    current_line_blame_opts = {
      virt_text_priority = 10000,
    },
    preview_config = {
      border = "rounded",
    },
    on_attach = function(buf)
      local binder = Binder.new({ "n" }):buffer(buf)
      binder:clone():desc("Previous Hunk"):bind("[h", gitsigns.prev_hunk)
      binder:clone():desc("Next Hunk"):bind("]h", gitsigns.next_hunk)
      binder:clone():desc("Hunk Diff All"):bind("<leader>hd", gitsigns.diffthis)
      binder
        :clone()
        :desc("Hunk Preview")
        :bind("<leader>hp", gitsigns.preview_hunk)
      binder
        :clone()
        :desc("Hunk Reset All")
        :bind("<leader>hR", gitsigns.reset_buffer)
      binder:clone():desc("Hunk Reset"):bind("<leader>hr", gitsigns.reset_hunk)
      binder
        :clone()
        :desc("Hunk Add All")
        :bind("<leader>hA", gitsigns.stage_buffer)
      binder:clone():desc("Hunk Add"):bind("<leader>ha", gitsigns.stage_hunk)
    end,
  })
end

return spec
