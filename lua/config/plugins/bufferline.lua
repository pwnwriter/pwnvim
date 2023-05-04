local spec = {
  "akinsho/bufferline.nvim",
  priority = 10000,
 event = "BufWinEnter",

}

function spec:config()
  local nvimtree= require("bufferline")

  nvimtree.setup()
end

return spec
