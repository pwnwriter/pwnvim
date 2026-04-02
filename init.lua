-- ┏┓     ┓┏•
-- ┃┃┓┳┏┏┓┃┃┓┳┳┳
-- ┣┛┗┻┛┛┗┗┛┗┛┗┗
-- Neo(vim) the less is more
--               @pwnwriter/pwnvim

if vim.loader then
  vim.loader.enable()
end

require("opts").initial()

require("plugins.cpt")
require("plugins.lazydev")
require("plugins.mini")
require("plugins.blink")
require("plugins.snacks")
require("plugins.misc")

require("opts").final()
require("mappings").general()
require("mappings").misc()
require("cmdline")
require("lsp")
