local icons = require "config.icons"

local lazy_path = vim.fs.normalize(vim.fn.stdpath "data" .. "/lazy/lazy.nvim")
if not vim.loop.fs_access(lazy_path, "R") then
  vim.fn.system {
    "git",
    "clone",
    "--single-branch",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    lazy_path,
  }
end
vim.opt.runtimepath:prepend { lazy_path }

local lazy = require "lazy"

lazy.setup("plugins", {
  concurrency = 4,
  defaults = {
    lazy = true,
  },
  install = {
    colorscheme = { "catppuccin" },
  },
  dev = {
    path = vim.env.NVIM_DEV,
  },
  performance = {
    cache = {
      enabled = true,
    },
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
    border = "solid",
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
