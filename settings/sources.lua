-- settings/sources.lua
local null = require("null-ls")

-- $ cargo install stylua
null.register(null.builtins.formatting.stylua)
