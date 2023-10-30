local default_plugins = {
  {
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
    init = function()
      require "catppuccin"
    end,
    config = function()
      local opts = require "plugins.configs.colorscheme"
      require("catppuccin").setup(opts)
      require("catppuccin").load()
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
    build = ":TSUpdate",
    name = "treesitter",
    init = function()
      require("core.utils").lazy_load "treesitter"
    end,
    config = function()
      local opts = require "plugins.configs.treesitter"
      require("nvim-treesitter.configs").setup(opts)
    end,
  },
  { "nvim-tree/nvim-web-devicons", lazy = true },
  {
    "echasnovski/mini.nvim",
    name = "mini",
    version = false,
    event = { "InsertEnter" },
    keys = { "<leader>e", "<leader>ff", "<leader>b", "<leader>fr", "<leader>fw", "<leader>q", "<leader>ti", "<C-q>" },
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      local mini_config = require "plugins.configs.mini_nvim"
      local mini_modules =
        { "pairs", "surround", "comment", "files", "hipatterns", "bufremove", "pick", "move", "indentscope" }

      require("core.mappings").mini()
      for _, module in ipairs(mini_modules) do
        require("mini." .. module).setup(mini_config[module])
      end
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    name = "cmp",
    config = true,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "L3MON4D3/LuaSnip",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
    },
    event = "InsertEnter",
    config = function()
      require "plugins.configs.cmp"
    end,
  },

  {
    "L3MON4D3/LuaSnip",
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load()
    end,
  },

  {
    "neovim/nvim-lspconfig",
    name = "lspconfig",
    cmd = { "LspInfo", "LspInstall", "LspUninstall" },
    event = {
      "BufReadPre",
      "BufNewFile",
    },
    init = function()
      require("core.utils").lazy_load "lspconfig"
    end,
    config = function()
      require "plugins.configs.lspconfig"
    end,
  },

  {
    "williamboman/mason.nvim",
    cmd = { "Mason", "MasonInstall", "MasonInstallAll", "MasonUpdate" },
    opts = function()
      return require "plugins.configs.mason"
    end,
    config = function(_, opts)
      require("mason").setup(opts)
    end,
  },

  {
    "NvChad/nvterm",
    keys = { "<A-R>", "<A-h>", "<A-H>", "<A-t>" },
    config = function()
      require("core.mappings").terminal()
      require("nvterm").setup()
    end,
  },
  {
    "rcarriga/nvim-notify",
    event = "UiEnter",
    config = function()
      local opts = require("plugins.configs.fancy").notify
      require("notify").setup(opts)
    end,
  },

  {
    "folke/noice.nvim",
    event = "UiEnter",
    name = "noice",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    config = function()
      local opts = require("plugins.configs.fancy").noice
      require("noice").setup(opts)
    end,
  },

  {
    "utilyre/barbecue.nvim",
    name = "barbecue",
    dependencies = {
      "SmiteshP/nvim-navic",
      "nvim-tree/nvim-web-devicons",
    },
    event = {
      "BufReadPre",
      "BufNewFile",
    },

    config = function()
      local opts = require("plugins.configs.fancy").barbecue
      require("barbecue").setup(opts)
    end,
  },
  {
    "utilyre/sentiment.nvim",
    version = "*",
    name = "sentiment",
    event = { "InsertCharPre", "InsertEnter" },
    opts = {},
    init = function()
      vim.g.loaded_matchparen = 1
    end,
  },
}

require("lazy").setup(default_plugins, require "plugins.configs.lazy_nvim")
