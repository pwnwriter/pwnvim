local Binder = require("config.Binder")
local icons = require("config.icons")

local spec = {
	"nvim-telescope/telescope.nvim",
	name = "telescope",
	build = "make",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
	},
	cmd = {
		"Telescope",
	},
	keys = {
		"<leader>fr",
		"<leader>ft",
		"<leader>ff",
		"<leader>fw",
	},
}

function spec:config()
	local telescope = require("telescope")
	local themes = require("telescope.themes")
	local builtin = require("telescope.builtin")

	telescope.setup({
		defaults = vim.tbl_deep_extend("force", themes.get_dropdown(), {
			file_ignore_patterns = { ".git", "^node_modules", "target"},
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
		},
	})

	local binder = Binder.new():with_modes({ "n" })
	binder:bind("<leader>fr", builtin.resume)
	binder:bind("<leader>ft", builtin.filetypes)
	binder:bind("<leader>ff", builtin.find_files)
	binder:bind("<leader>fw", builtin.live_grep)
	binder:bind("<leader>ch", builtin.command_history)
	binder:bind("<leader>cf", builtin.current_buffer_fuzzy_find)
end

return spec
