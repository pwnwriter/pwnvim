local icons = require "config.icons"

local spec = {
  "williamboman/mason.nvim",
  name = "mason",
  lazy = true,
  priority = 10000,
  cmd = {
    "Mason",
    "MasonInstall",
    "MasonInstallAll",
    "MasonUninstall",
    "MasonUninstallAll",
    "MasonLog",
    "MasonUpdate",
  },
  build = ":MasonUpdate",
}

function spec:config()
  local mason = require "mason"
  mason.setup {
    ui = {
      icons = {
        package_installed = icons.layout.installed,
        package_pending = icons.layout.pending,
        package_uninstalled = icons.layout.uninstalled,
      },

      keymaps = {
        toggle_server_expand = "<CR>",
        install_server = "i",
        update_server = "u",
        check_server_version = "c",
        update_all_servers = "U",
        check_outdated_servers = "C",
        uninstall_server = "X",
        cancel_installation = "<C-c>",
      },
    },
    max_concurrent_installers = 10,
  }
end

return spec
