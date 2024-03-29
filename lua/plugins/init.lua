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
      local opts = require "plugins.colorscheme"
      require("catppuccin").setup(opts)
    end,
  },

  --- Mini stuffs
  {
    "echasnovski/mini.nvim",
    name = "mini",
    version = false,
    keys = {
      { "<leader>e", mode = "n" },
      { "<leader>ff", mode = "n" },
      { "<leader>b", mode = "n" },
      { "<leader>fr", mode = "n" },
      { "<leader>fw", mode = "n" },
      { "<leader>q", mode = "n" },
      { "<leader>ti", mode = "n" },
      { "<C-q>", mode = "n" },
      { "gcc", mode = "n" },
      { "<leader>", mode = "n" },
      { "gc", mode = "n" },
      { "gc", mode = "x" },
      { "H", mode = "x" },
      { "J", mode = "x" },
      { "K", mode = "x" },
      { "L", mode = "x" },
    },
    event = { "InsertEnter" },
    config = function()
      local mini_config = require "plugins.mini_nvim"
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
        "clue",
      }
      require("core.mappings").mini()
      for _, module in ipairs(mini_modules) do
        require("mini." .. module).setup(mini_config[module])
      end
    end,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    name = "treesitter",
    cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
    build = ":TSUpdate",
    event = {
      "BufReadPost",
      "BufNewFile",
    },
    config = function()
      local opts = require("plugins.fancy").treesitter
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
      require "plugins.cmp"
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
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require "plugins.lsp"
      require("core.mappings").lsp()
    end,
  },

  --- Fancy stuffs

  {
    "rcarriga/nvim-notify",
    event = "VeryLazy",
    name = "notify",
    config = function()
      local opts = require("plugins.fancy").notify
      require("notify").setup(opts)
    end,
  },

  {
    "folke/noice.nvim",
    name = "noice",
    commit = "1f087c2495bbc824b556329eb389dfff8964e5a3",
    event = "UiEnter",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "notify",
    },
    opts = function()
      return require("plugins.fancy").noice
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
      return require("plugins.fancy").gitsigns
    end,
    config = function(_, opts)
      require("gitsigns").setup(opts)
    end,
  },

  {
    name = "options",
    event = "VeryLazy",
    dir = conf_path,
    config = function()
      vim.schedule(function()
        require("core.opts").final()
        require("core.mappings").general()
        require("core.mappings").misc()
        require("core.utils").autocmds()
      end)
    end,
  },
}

require("lazy").setup(plugins, require "plugins.lazy_nvim")
