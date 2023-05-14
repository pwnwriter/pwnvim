local Binder = require("core.binder")
local icons = require("core.icons")

local spec = {
  "nvim-telescope/telescope.nvim",
  cmd = { "Telescope" },
    pickers = {
    colorscheme = {
      enable_preview = true
    }
},
  keys = {
    "<leader>fr",
    "<leader>ft",
    "<leader>F",
    "<leader>fw",
    "<leader><space>",
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
 },
}

function spec:config()
  local telescope = require("telescope")
  local themes = require("telescope.themes")
  local builtin = require("telescope.builtin")

  telescope.setup({
    defaults = vim.tbl_deep_extend("force", themes.get_dropdown(), {
      path_display = { "truncate" },
      prompt_prefix = icons.widget.telescope .. " ",
      selection_caret = "  ",
      mappings = {
        i = {
          ["<s-tab>"] = "move_selection_previous",
          ["<tab>"] = "move_selection_next",
        },
      },
    }),
    pickers = {
      find_files = {
        hidden = true,
      },
      live_grep = {
        disable_coordinates = true,
      },
      buffers = {
        sort_mru = true,
        ignore_current_buffer = true,
        mappings = {
          i = {
            ["<c-x>"] = "delete_buffer",
          },
        },
      },
    },
  })

  local binder = Binder.new({ "n" })
  binder:clone():desc("Find Recent"):bind("<leader>fr", builtin.resume)
  binder:clone():desc("Find Type"):bind("<leader>ft", builtin.filetypes)
  binder:clone():desc("Find File"):bind("<leader>F", builtin.find_files)
  binder:clone():desc("Find Word"):bind("<leader>fw", builtin.live_grep)
  binder:clone():desc("Find Buffer"):bind("<leader><b>", builtin.buffers)
end

return spec
