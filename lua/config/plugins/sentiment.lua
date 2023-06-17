local spec = {
  "utilyre/sentiment.nvim",
  name = "sentiment",
  event = { "InsertCharPre",
          "InsertEnter" },
}

function spec:config()
  local sentiment = require("sentiment")

  sentiment.setup()
end

return spec
