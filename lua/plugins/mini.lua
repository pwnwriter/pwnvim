local spec = {
    "echasnovski/mini.nvim",
    name = "mini",
    version = "*",
    event = { "InsertCharPre" },
}

function spec:config()
    local pairs = require("mini.pairs")
    local surround = require("mini.surround")
    local comment = require("mini.comment")

    pairs.setup({
        modes = { insert = true, command = false, terminal = false },
        mappings = {
            ["("] = { action = "open", pair = "()", neigh_pattern = "[^\\]." },
            ["["] = { action = "open", pair = "[]", neigh_pattern = "[^\\]." },
            ["{"] = { action = "open", pair = "{}", neigh_pattern = "[^\\]." },
            [")"] = { action = "close", pair = "()", neigh_pattern = "[^\\]." },
            ["]"] = { action = "close", pair = "[]", neigh_pattern = "[^\\]." },
            ["}"] = { action = "close", pair = "{}", neigh_pattern = "[^\\]." },
            ['"'] = { action = "closeopen", pair = '""', neigh_pattern = "[^\\].", register = { cr = false } },
            ["'"] = { action = "closeopen", pair = "''", neigh_pattern = "[^%a\\].", register = { cr = false } },
            ["`"] = { action = "closeopen", pair = "``", neigh_pattern = "[^\\].", register = { cr = false } },
            ["<"] = { action = "closeopen", pair = "<>", neigh_pattern = "[^\\].", register = { cr = false } },
        },
    })

    surround.setup({
        custom_surroundings = nil,
        highlight_duration = 500,
        mappings = {
            add = "sa",
            delete = "sd",
            find = "sf",
            find_left = "sF",
            highlight = "sh",
            replace = "sr",
            update_n_lines = "sn",
            suffix_last = "l",
            suffix_next = "n",
        },
        n_lines = 20,
        respect_selection_type = false,
        search_method = "cover",
        silent = true,
    })
    comment.setup({
        comment = "gc",

        -- Toggle comment on current line
        comment_line = "gcc",

        -- Define 'comment' textobject (like `dgc` - delete whole comment block)
        textobject = "gc",
    })
end

return spec
