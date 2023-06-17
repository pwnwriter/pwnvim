local Binder = require("config.Binder")

local spec = {
   "j-morano/buffer_manager.nvim",
   name = "buffer_manager",
   dependencies = {
      "nvim-lua/plenary.nvim",
   },
   event = {
      "BufNewFile",
   },
   cmd = {
      "BufferManager",
   },
   keys = {
      "<leader>b",
      "<s-tab>",
      "<tab>",
   },
}

function spec:config()
   local bfs = require("buffer_manager.ui")

   local binder = Binder.new():with_modes({ "n" })
   binder:bind("<leader>b", bfs.toggle_quick_menu)
   binder:bind("<s-tab>", bfs.nav_next)
   binder:bind("<tab>", bfs.nav_prev)
end

return spec

