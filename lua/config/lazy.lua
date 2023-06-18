local Binder = require("config.Binder")
local icons = require("config.icons")

local lazy_path = vim.fs.normalize(vim.fn.stdpath("data") .. "/lazy/lazy.nvim")
if not vim.loop.fs_access(lazy_path, "R") then
  vim.fn.system({
    "git",
    "clone",
    "--single-branch",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    lazy_path,
  })
end
vim.opt.runtimepath:prepend({ lazy_path })

local lazy = require("lazy")

lazy.setup("config.plugins", {
  concurrency = 4,
  install = {
    colorscheme = { "catppuccin" },
  },
  dev = {
    path = vim.env.NVIM_DEV
  },
  performance = {

    rtp = {
      disabled_plugins = {
        "gzip",
        "netrwPlugin",
        "health",
        "man",
        "matchit",
        "matchparen",
        "rplugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
  ui = {
    border = "rounded",
    icons = {
      lazy = icons.widget.lazy .. "  ",
      not_loaded = icons.widget.inactive,
      loaded = icons.widget.active,
      task = icons.widget.task,
      source = icons.widget.source,
      start = icons.widget.start,
      plugin = icons.widget.plugin,
      event = icons.widget.event,
      keys = icons.widget.keymap,
      cmd = icons.widget.command,
      ft = icons.widget.filetype,
      init = icons.widget.config,
      runtime = icons.widget.runtime,
      import = icons.widget.import,
      config = icons.widget.config,
      list = {
        icons.layout.list,
        icons.layout.list,
        icons.layout.list,
        icons.layout.list,
      },
    },
  },
})

local binder = Binder.new():with_modes({ "n" })
binder:bind("<leader>ph", lazy.home)
binder:bind("<leader>pi", lazy.install)
binder:bind("<leader>pu", lazy.update)
binder:bind("<leader>ps", lazy.sync)
binder:bind("<leader>px", lazy.clean)
binder:bind("<leader>pc", lazy.check)
binder:bind("<leader>pl", lazy.log)
binder:bind("<leader>pr", lazy.restore)
binder:bind("<leader>pp", lazy.profile)
binder:bind("<leader>pd", lazy.debug)
