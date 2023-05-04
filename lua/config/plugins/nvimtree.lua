local spec = {
  "nvim-tree/nvim-tree.lua",
  priority = 10000,
  cmd = {"NvimTreeToggle", "NvimTreeFocus"},

  dependeicies = {
        "nvim-tree/nvim-web-devicons",
  },


}
function spec:config()
  local nvimtree= require("nvim-tree")

  nvimtree.setup()
end

return spec



