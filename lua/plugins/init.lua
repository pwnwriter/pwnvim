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
    opts = {
      transparent_background = true,
      compile_path = vim.fn.stdpath "cache" .. "/catppuccin",
      compile = true,
      flavour = "mocha",
      integrations = {
        snacks = true,
        cmp = true,
        treesitter = true,
        mason = true,
        native_lsp = {
          enabled = true,
          virtual_text = {
            errors = { "italic" },
            hints = { "italic" },
            warnings = { "italic" },
            information = { "italic" },
          },
          underlines = {
            errors = { "undercurl" },
            hints = { "undercurl" },
            warnings = { "undercurl" },
            information = { "undercurl" },
          },
        },
        mini = {
          enabled = true,
        },
      },

    },
  },

  --- Mini stuffs
  {
    "echasnovski/mini.nvim",
    name = "mini",
    version = false,
    keys = function()
      require("mappings").mini()
    end,
    init = function()
      package.preload["nvim-web-devicons"] = function()
        package.loaded["nvim-web-devicons"] = {}
        require("mini.icons").mock_nvim_web_devicons()
        return package.loaded["nvim-web-devicons"]
      end
    end,
    event = function()
      if vim.fn.argc() == 0 then
        return "VimEnter"
      else
        return { "InsertEnter", "LspAttach" }
      end
    end,

    config = function()
      local mini_config = require "plugins.mini_nvim"
      local mini_modules = {
        "icons",
        "comment",
        "starter",
        "pairs",
        "ai",
        "surround",
        "files",
        "hipatterns",
        "bufremove",
        "pick",
        "move",
        "extra",
        "visits",
        "clue",
        "notify",
        "git",
        "diff",
        "operators",
      }
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
      "BufReadPost",
      "BufNewFile",
    },
    config = function()
      require("nvim-treesitter.configs").setup {
        ensure_installed = { "lua", "vimdoc", "rust", "go", "astro", "json", "toml", "markdown" },
        highlight = {
          enable = true,
          use_languagetree = true,
        },

        indent = { enable = true },
      }
    end,
  },

  --- Completion menu stuffs
  {
    "saghen/blink.cmp",
    event = { "LspAttach", },
    dependencies = {
      "folke/lazydev.nvim",
      { dir = "/Users/pwnwriter/Dev/friendly-snippets" },
      ft = "lua",
      opts = {
        library = {
          { path = "${3rd}/luv/library", words = { "vim%.uv" } },
        },
      },

    },
    version = "v0.*",
    opts = {
      keymap = { preset = 'enter' },
      sources = {
        completion = {
          enabled_providers = { "lsp", "path", "snippets", "buffer", "lazydev" },
        },
        providers = {
          lsp = { fallback_for = { "lazydev" } },
          lazydev = { name = "LazyDev", module = "lazydev.integrations.blink" },
        }
      },


      completion = {
        accept = { auto_brackets = { enabled = true } },
        trigger = {
          show_on_insert_on_trigger_character = false,
        },
        menu = {
          border = vim.g.border_style,
          scrolloff = 1,
          scrollbar = false,
          columns = { { 'kind_icon' }, { 'label', 'label_description', gap = 0 } },

          draw = {
            padding = 0,
            gap = 1,
            treesitter = true,
          }
        },

        documentation = {
          auto_show_delay_ms = 0,
          auto_show = true,
          window = {
            border = vim.g.border_style,
          },
        },
      },

      signature = {
        enabled = false,
        border = "single",
      },

    },
  },

  {
    "Bekaboo/dropbar.nvim",
    name = "dropbar",
    keys = {
      require("mappings").map({ "n" }, "<leader>p", function()
        require("dropbar.api").pick(vim.v.count ~= 0 and vim.v.count)
      end, "Toggle dropbar menu"),
    },
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("dropbar").setup()
    end,
  },

  {
    "folke/snacks.nvim",
    name = "snacks",
    keys = {
      require("mappings").map({ "n" }, "<leader>o", function()
        require("snacks").scratch()
      end, "Toggle scratch pad"),
    },
    event = { "BufReadPost" },
    opts = {
      words = {
        enabled = true,
        debounce = 500,
      },
      notifier = {
        wo = {
          winblend = vim.g.winblend,
        },
      },
      indent = {
        enabled = true,
      },
    },
  },

  --- lsp stuffs
  {
    "neovim/nvim-lspconfig",
    name = "lspconfig",
    cmd = { "LspInfo", "LspInstall", "LspUninstall" },
    event = { "BufReadPost", "BufNewFile" },
    keys = function()
      require("mappings").lsp()
    end,
    config = function()
      require "plugins.lsp"
    end,
  },

  {
    "MeanderingProgrammer/render-markdown.nvim",
    ft = "markdown",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
  },


  {
    name = "options",
    event = "VeryLazy",
    dir = conf_path,
    config = function()
      require("opts").final()
      require("mappings").general()
      require("mappings").misc()
      require("modules").autocmds()
    end,
  },

}

require("lazy").setup(plugins, {
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
    reset_packpath = true,
    rtp = {
      disabled_plugins = {
        "osc52",
        "parser",
        "gzip",
        "netrwPlugin",
        "health",
        "man",
        "matchit",
        "rplugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
        "shadafile",
        "spellfile",
        "editorconfig",
      },
    },
  },
  ui = {
    border = "solid",
    title = "lazy.nvim",
    size = { width = 0.9, height = 0.9 },
  },
})
