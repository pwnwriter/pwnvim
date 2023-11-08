-- ╔═╗┬ ┬┌┐┌╦  ╦╦╔╦╗
-- ╠═╝││││││╚╗╔╝║║║║
-- ╩  └┴┘┘└┘ ╚╝ ╩╩ ╩
-- Neo(vim) the K1ss way
--    @pwnwriter/pwnvim

vim.loader.enable()

require("core.opts").initial()

local lazy_path = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
require("core.utils").lazy(lazy_path)

require "plugins"
