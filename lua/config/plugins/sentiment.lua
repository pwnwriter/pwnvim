local spec = {
  "utilyre/sentiment.nvim",
  event = { "VeryLazy" },
}

function spec:config()
  local sentiment = require("sentiment")

  sentiment.setup()
end

return spec
