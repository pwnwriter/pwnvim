-- ╔═╗┬ ┬┌┐┌╦  ╦╦╔╦╗
-- ╠═╝││││││╚╗╔╝║║║║
-- ╩  └┴┘┘└┘ ╚╝ ╩╩ ╩
-- Neo(vim) the K1ss way
--    @pwnwriter/pwnvim

if vim.loader then
  vim.loader.enable()
end

local modules = { "opts", "lazy" }

for _, module in ipairs(modules) do
  require("config." .. module)
end

vim.api.nvim_create_autocmd("User", {
  pattern = "VeryLazy",
  callback = function()
    require "config.keys"
    require "config.diagnostic"
  end,
})

