return {
  {
    "neovim/nvim-lspconfig",
    name = "lspconfig",
    event = { "BufReadPost", "BufNewFile" },
    keys = function()
      require("mappings").lsp()
    end,
    config = function()
      require "lsp"
    end,
  },

  {
    {
      "folke/lazydev.nvim",
      ft = "lua",
      opts = {
        library = {
          { path = "${3rd}/luv/library", words = { "vim%.uv" } },
        },
        enabled = true,
      },
    },

  }
}
