local conf_path = vim.fn.stdpath "config" --[[@as string]]
return {
  {
    "MeanderingProgrammer/render-markdown.nvim",
    ft = "markdown",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
  },

  {
  "jake-stewart/auto-cmdheight.nvim",
  lazy = false,
  opts = {
    max_lines = 5,
    duration = 2,
    remove_on_key = true,
  }
},

  {
    "Bekaboo/dropbar.nvim",
    name = "dropbar",
    event = { "BufReadPost", "BufNewFile" },
    keys = {
      require("mappings").map({ "n" }, "<leader>p", function()
        require("dropbar.api").pick(vim.v.count ~= 0 and vim.v.count)
      end, "Toggle dropbar menu"),
    },
    opts = {},
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

  {
    name = "options",
    event = "VeryLazy",
    dir = conf_path,
    config = function()
      require("opts").final()
      require("mappings").general()
      require("mappings").misc()
    end,
  },

}
