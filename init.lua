-- ╔═╗┬ ┬┌┐┌╦  ╦╦╔╦╗
-- ╠═╝││││││╚╗╔╝║║║║
-- ╩  └┴┘┘└┘ ╚╝ ╩╩ ╩
-- Neo(vim) the K1ss way
--    @pwnwriter/pwnvim

vim.loader.enable()

require("core.opts").initial()

require("core.utils").lazy(vim.fn.stdpath "data" .. "/lazy/lazy.nvim")

local lazy_path = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
vim.opt.runtimepath:prepend(lazy_path)

require "plugins"

local shada = vim.o.shada
vim.api.nvim_create_autocmd("User", {
  pattern = "VeryLazy",
  callback = function()
    require("core.mappings").general()
    require("core.opts").final()
    vim.o.shada = shada
    pcall(vim.cmd.rshada, { bang = true })
  end,
})
