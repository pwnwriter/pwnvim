require"staline".setup {
  sections = {
    left = {'mode', 'branch'},
    mid = {'lsp'},
    right = {'file_name', 'line_column'}
  },
  mode_colors = {n = "#EBBCBA", i = "#C4A7E7", c = "#9CCFD8", v = "#F6C177", V = "#F6C177"},
  defaults = {true_colors = true, branch_symbol = " "}
}

