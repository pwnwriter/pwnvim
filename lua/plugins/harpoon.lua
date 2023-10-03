local plugin = "harpoon"
local binder = require("config.binder")

return {
  "ThePrimeagen/" .. plugin,

  keys = {
    "<a-1>",
    "<a-2>",
    "<a-3>",
    "<a-4>",
    "<a-5>",
    "<a-6>",
    "<a-7>",
    "<a-8>",
    "<a-9>",
    "<a-a>",
    "<a-s>",
  },

  opts = function(_, opts)
    opts.global_settings = {
      save_on_toggle = false,
      save_on_change = true,
      enter_on_sendcmd = false,
      tmux_autoclose_windows = false,
      excluded_filetypes = { plugin, "alpha", "dashboard", "gitcommit" },
      mark_branch = false,
    }
  end,

  config = function(_, opts)
    require(plugin).setup(opts)
    local mark = require(plugin .. ".mark")
    local ui = require(plugin .. ".ui")

    local binder = binder.new():with_modes({ "n", "i" })

    -- Harpoon marked files 1 through 4.
    binder:bind("<a-1>", function()
      ui.nav_file(1)
    end)
    binder:bind("<a-2>", function()
      ui.nav_file(2)
    end)
    binder:bind("<a-3>", function()
      ui.nav_file(3)
    end)
    binder:bind("<a-4>", function()
      ui.nav_file(4)
    end)

    -- Harpoon next and previous.
    binder:bind("a<Tab>", function()
      ui.nav_next()
    end)
    binder:bind("a<s-Tab>", function()
      ui.nav_prev()
    end)

    -- Harpoon user interface.
    binder:bind("<a-s>", ui.toggle_quick_menu)
    binder:bind("<a-a>", mark.add_file)
  end,
}
