local spec = {
  "tamton-aquib/staline.nvim",
  priority = 10000,
  event = "BufWinEnter",
}

function spec:config()
  local sta= require("staline")
  sta.setup({
          	sections = {
		left = {
			' ', 'right_sep_double', '-mode', 'left_sep_double', ' ',
			'right_sep', '-file_name', 'left_sep', ' ',
			'right_sep_double', '-branch', 'left_sep_double', ' ',
		},
		mid  = {'lsp'},
		right= {
			'right_sep', '-cool_symbol', 'left_sep', ' ',
			'right_sep', '- ', '-lsp_name', '- ', 'left_sep',
			'right_sep_double', '-line_column', 'left_sep_double', ' ',
		}
	},

	defaults={
		fg = "#986fec",
		cool_symbol = "",
		left_separator = "",
		right_separator = "",
		true_colors = true,
		line_column = "[%l:%c] 並%p%% ",
		-- font_active = "italic"
	},
	mode_colors = {
		n  = "#181a23",
		i  = "#181a23",
		ic = "#181a23",
		c  = "#181a23",
		v  = "#181a23",       -- etc
		t  = "#181a23",       -- etc
	}

  })
end

return spec
