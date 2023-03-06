local status, bufferline = pcall(require, "bufferline")
if not status then
    print("ERROR bufferline")
    return
end

require("bufferline").setup {
    highlights = {
        fill = {},
        background = {},
        tab_selected = {},
        buffer_selected = {italic = true},
        diagnostic_selected = {italic = false},
        hint_selected = {italic = false},
        pick_selected = {italic = false},
        pick_visible = {italic = false},
        pick = {italic = false}
    },
    options = {
        --separator_style = "slant",
        indicator = {
            icon = "▎",
            style = "icon"
        },
        buffer_close_icon = "",
        modified_icon = "●",
        close_icon = "",
        left_trunc_marker = "",
        right_trunc_marker = "",
        --numbers = "ordinal",
        max_name_length = 15,
        max_prefix_length = 6,
        diagnostics = "nvim_lsp",
        show_buffer_icons = true,
        show_buffer_close_icons = true,
        show_close_icon = true,
        persist_buffer_sort = true,
        enforce_regular_tabs = true,
        diagnostics_indicator = function(count, level)
            local icon = level:match("error") and "" or ""
            return icon .. count
        end
    }
}

