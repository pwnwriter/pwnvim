-- ╔═╗┬ ┬┌┐┌╦  ╦╦╔╦╗
-- ╠═╝││││││╚╗╔╝║║║║
-- ╩  └┴┘┘└┘ ╚╝ ╩╩ ╩
-- Neo(vim) the K1ss way
--    @pwnwriter/pwnvim

if vim.loader then
  vim.loader.enable()
end

local modules = { "opts", "lazy", "keys", "diagnostic" }

for _, module in ipairs(modules) do
  require("config." .. module)
end
