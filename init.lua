-- ╔═╗┬ ┬┌┐┌╦  ╦╦╔╦╗
-- ╠═╝││││││╚╗╔╝║║║║
-- ╩  └┴┘┘└┘ ╚╝ ╩╩ ╩
-- Neo(vim) the K1ss way
--    @pwnwriter/pwnvim

vim.loader.enable()

require("core.opts").initial()

require("core.utils").lazy(vim.fn.stdpath "data" .. "/lazy/lazy.nvim")

local lazy_path = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
vim.opt.rtp:prepend(lazy_path)

require "plugins"
