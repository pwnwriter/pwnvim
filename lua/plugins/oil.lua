local Binder = require("config.Binder")

local spec = {
  "stevearc/oil.nvim",
  name = "oil",
  keys = {
    "<leader>o",
  },

  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
}

function spec:config()
  local oil = require("oil")

  oil.setup({
    use_default_keymaps = true,
    view_options = {
      show_hidden = false,
      is_hidden_file = function(name, bufnr)
        return vim.startswith(name, ".")
      end,
      is_always_hidden = function(name, bufnr)
        return false
      end,
      sort = {
        { "type", "asc" },
        { "name", "asc" },
      },
    },
    float = {
      padding = 1,
      max_width = 60,
      max_height = 16,
      border = "rounded",
      win_options = {
        winblend = 0,
      },
      override = function(conf)
        return conf
      end,
    },

    preview = {
      max_width = 0.9,
      min_width = { 40, 0.4 },
      width = nil,
      max_height = 0.9,
      min_height = { 5, 0.1 },
      height = nil,
      border = "rounded",
      win_options = {
        winblend = 0,
      },
    },

    keymaps = {
      ["g?"] = "actions.show_help",
      ["<CR>"] = "actions.select",
      ["<C-s>"] = "actions.select_vsplit",
      ["<C-h>"] = "actions.select_split",
      ["<C-t>"] = "actions.select_tab",
      ["<C-p>"] = "actions.preview",
      ["<C-c>"] = "actions.close",
      ["<C-l>"] = "actions.refresh",
      ["-"] = "actions.parent",
      ["_"] = "actions.open_cwd",
      ["`"] = "actions.cd",
      ["~"] = "actions.tcd",
      ["gs"] = "actions.change_sort",
      ["g."] = "actions.toggle_hidden",
    },
  })

  local binder = Binder.new():with_modes({ "n" })
  binder:bind("<leader>o", function()
    vim.cmd("Oil --float")
  end)
end

return spec
