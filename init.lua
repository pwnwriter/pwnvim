-- ╔═╗┬ ┬┌┐┌╦  ╦╦╔╦╗
-- ╠═╝││││││╚╗╔╝║║║║
-- ╩  └┴┘┘└┘ ╚╝ ╩╩ ╩
-- Neo(vim) the K1ss way
--    @pwnwriter/pwnvim

local modules = {
  "config.opts",
  "config.lazy",
  "config.keys",
  "config.diagnostic",
}

for _, module in ipairs(modules) do
  require(module)
end
