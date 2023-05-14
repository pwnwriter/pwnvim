local spec = {
  "akinsho/bufferline.nvim",
  priority = 10000,
  event = "BufWinEnter",

  dependeicies = {
        "nvim-tree/nvim-web-devicons",
  },


}

  function spec:config()
  local buff= require("bufferline")
  buff.setup({
    highlights = {
      fill = {},
      background = {},
      tab_selected = {},
      buffer_selected = {italic = true},
      diagnostic_selected = {italic = false},
      hint_selected = {italic = false},
      pick_selected = {italic = false},
      pick_visible = {italic = false},
      pick = {italic = false}
    },

  })
end

return spec
