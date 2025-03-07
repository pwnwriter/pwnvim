-- ┏┓     ┓┏•
-- ┃┃┓┏┏┏┓┃┃┓┏┳┓
-- ┣┛┗┻┛┛┗┗┛┗┛┗┗
-- Neo(vim) the less is more
--               @pwnwriter/pwnvim

if vim.loader then
  vim.loader.enable()
end

require("opts").initial()

local lazy_path = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazy_path) then
  local lazy_url = "https://github.com/folke/lazy.nvim"
  vim.fn.system { "git", "clone", "--filter=blob:none", lazy_url, "--branch=stable", lazy_path }
end

vim.opt.rtp:prepend(lazy_path)

require "lazy_spec"
