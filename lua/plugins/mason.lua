local spec = {
  "williamboman/mason.nvim",
  priority = 10000,
  cmd = { "Mason", "MasonInstall", "MasonInstallAll", "MasonUninstall", "MasonUninstallAll", "MasonLog" },
  event = { "VeryLazy" },
  config = function()
    local masonvim= require("mason")
    masonvim.setup()
  end
}

return spec

