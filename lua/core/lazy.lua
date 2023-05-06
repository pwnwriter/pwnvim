local Binder = require("core.binder")
local icons = require("core.icons")

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

lazy.setup("plugins", {
  concurrency = 4,
  install = {
    colorscheme = { "catppuccin", "habamax" },
  },
  dev = {
    path = os.getenv("NVIM_DEV") or vim.fs.normalize("$HOME/rusty"),
  },
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
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

local binder = Binder.new({ "n" })
binder:clone():desc("Plugin Home"):bind("<leader>ph", lazy.home)
binder:clone():desc("Plugin Install"):bind("<leader>pi", lazy.install)
binder:clone():desc("Plugin Update"):bind("<leader>pu", lazy.update)
binder:clone():desc("Plugin Sync"):bind("<leader>ps", lazy.sync)
binder:clone():desc("Plugin Clean"):bind("<leader>px", lazy.clean)
binder:clone():desc("Plugin Check"):bind("<leader>pc", lazy.check)
binder:clone():desc("Plugin Log"):bind("<leader>pl", lazy.log)
binder:clone():desc("Plugin Restore"):bind("<leader>pr", lazy.restore)
binder:clone():desc("Plugin Profile"):bind("<leader>pp", lazy.profile)
binder:clone():desc("Plugin Debug"):bind("<leader>pd", lazy.debug)
