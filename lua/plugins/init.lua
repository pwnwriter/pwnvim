local conf_path = vim.fn.stdpath "config" --[[@as string]]

local plugins = {
  -- colorschemes
  {
    "catppuccin/nvim",
    lazy = true,
    priority = 1000,
    name = "catppuccin",
    init = function()
      vim.cmd.colorscheme "catppuccin"
    end,
    config = function()
      local opts = require "plugins.configs.colorscheme"
      require("catppuccin").setup(opts)
    end,
  },

  --- Mini stuffs
  {
    "echasnovski/mini.nvim",
    name = "mini",
    version = false,
    event = { "InsertEnter" },
    keys = {
      "<leader>e",
      "<leader>ff",
      "<leader>b",
      "<leader>fr",
      "<leader>fw",
      "<leader>q",
      "<leader>ti",
      "<C-q>",
      { "gcc", mode = "n" },
      { "gc", mode = "n" },
      { "gc", mode = "x" },
    },
    config = function()
      local mini_config = require "plugins.configs.mini_nvim"
      local mini_modules = {
        "pairs",
        "ai",
        "surround",
        "comment",
        "files",
        "hipatterns",
        "bufremove",
        "pick",
        "move",
        "indentscope",
        "extra",
        "visits",
      }
      require("core.mappings").mini()
      for _, module in ipairs(mini_modules) do
        require("mini." .. module).setup(mini_config[module])
      end
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    name = "treesitter",
    cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
    build = ":TSUpdate",
    event = {
      "BufReadPre",
      "BufNewFile",
    },
    config = function()
      local opts = require("plugins.configs.fancy").treesitter
      require("nvim-treesitter.configs").setup(opts)
    end,
  },

  --- Completion menu stuffs
  {
    "hrsh7th/nvim-cmp",
    name = "cmp",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "L3MON4D3/LuaSnip",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
    },
    event = { "LspAttach", "InsertCharPre" },
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

  --- lsp stuffs
  {
    "neovim/nvim-lspconfig",
    name = "lspconfig",
    cmd = { "LspInfo", "LspInstall", "LspUninstall" },
    event = {
      "LspAttach",
    },
    init = function()
      require("core.utils").lazy_load "lspconfig"
    end,
    config = function()
      require "plugins.configs.lsp"
    end,
  },

  --- Mason
  {
    "williamboman/mason.nvim",
    cmd = { "Mason", "MasonInstall", "MasonInstallAll", "MasonUpdate" },
    config = function()
      local opts = require("plugins.configs.fancy").mason
      require("mason").setup(opts)
    end,
  },

  --- Terminal
  {
    "NvChad/nvterm",
    keys = { "<A-R>", "<A-h>", "<A-H>", "<A-t>" },
    config = function()
      require("core.mappings").terminal()
      require("nvterm").setup()
    end,
  },

  --- Fancy stuffs

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
    name = "noice",
    event = "UiEnter",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    opts = function()
      return require("plugins.configs.fancy").noice
    end,
  },

  {
    "Bekaboo/dropbar.nvim",
    name = "dropbar",
    event = "BufReadPre",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    opts = function()
      require("core.mappings").dropbar()
      return require("plugins.configs.fancy").drop
    end,
  },

  -- git stuff
  {
    "lewis6991/gitsigns.nvim",
    name = "gitsigns",
    ft = { "gitcommit", "diff" },
    init = function()
      -- load gitsigns only when a git file is opened
      vim.api.nvim_create_autocmd({ "BufRead" }, {
        group = vim.api.nvim_create_augroup("GitSignsLazyLoad", { clear = true }),
        callback = function()
          vim.fn.jobstart({ "git", "-C", vim.loop.cwd(), "rev-parse" }, {
            on_exit = function(_, return_code)
              if return_code == 0 then
                vim.api.nvim_del_augroup_by_name "GitSignsLazyLoad"
                vim.schedule(function()
                  require("lazy").load { plugins = { "gitsigns" } }
                end)
              end
            end,
          })
        end,
      })
    end,
    opts = function()
      return require("plugins.configs.fancy").gitsigns
    end,
    config = function(_, opts)
      require("gitsigns").setup(opts)
    end,
  },

  {
    "utilyre/sentiment.nvim",
    version = "*",
    name = "sentiment",
    event = { "InsertCharPre", "InsertEnter" },
    opts = {},
  },

  {
    name = "options",
    event = "VeryLazy",
    dir = conf_path,
    config = function()
      require("core.opts").final()
      require("core.mappings").general()
    end,
  },
}

require("lazy").setup(plugins, require "plugins.configs.lazy_nvim")
