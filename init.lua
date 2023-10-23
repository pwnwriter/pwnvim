-- ╔═╗┬ ┬┌┐┌╦  ╦╦╔╦╗
-- ╠═╝││││││╚╗╔╝║║║║
-- ╩  └┴┘┘└┘ ╚╝ ╩╩ ╩
-- Neo(vim) the K1ss way
--    @pwnwriter/pwnvim

if vim.loader then
  vim.loader.enable()
end

local modules = {
  "opts",
  "lazy",
  "keys",
  "diagnostic",
}

for i = 1, 2 do
  require("config." .. modules[i])
end

vim.api.nvim_create_autocmd("User", {
  pattern = "VeryLazy",
  callback = function()
    for i = 3, 4 do
      require("config." .. modules[i])
    end
  end,
})
