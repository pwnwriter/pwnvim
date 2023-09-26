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
    local files = require("mini.files")
    local clue = require("mini.clue")

    pairs.setup({
        modes = { insert = true, command = false, terminal = false },
        mappings = {
            ["("] = { action = "open", pair = "()", neigh_pattern = "[^\\]." },
            ["["] = { action = "open", pair = "[]", neigh_pattern = "[^\\]." },
            ["{"] = { action = "open", pair = "{}", neigh_pattern = "[^\\]." },
            [")"] = { action = "close", pair = "()", neigh_pattern = "[^\\]." },
            ["]"] = { action = "close", pair = "[]", neigh_pattern = "[^\\]." },
            ["}"] = { action = "close", pair = "{}", neigh_pattern = "[^\\]." },
            ["\""] = {
                action = "closeopen",
                pair = "\"\"",
                neigh_pattern = "[^\\].",
                register = { cr = false },
            },
            ["'"] = {
                action = "closeopen",
                pair = "''",
                neigh_pattern = "[^%a\\].",
                register = { cr = false },
            },
            ["`"] = {
                action = "closeopen",
                pair = "``",
                neigh_pattern = "[^\\].",
                register = { cr = false },
            },
            ["<"] = {
                action = "closeopen",
                pair = "<>",
                neigh_pattern = "[^\\].",
                register = { cr = false },
            },
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
    files.setup({})
    clue.setup({
        triggers = {
            -- Leader triggers
            { mode = "n", keys = "<Leader>" },
            { mode = "x", keys = "<Leader>" },

            -- Built-in completion
            { mode = "i", keys = "<C-x>" },

            -- `g` key
            { mode = "n", keys = "g" },
            { mode = "x", keys = "g" },

            -- Marks
            { mode = "n", keys = "'" },
            { mode = "n", keys = "`" },
            { mode = "x", keys = "'" },
            { mode = "x", keys = "`" },

            -- Registers
            { mode = "n", keys = "\"" },
            { mode = "x", keys = "\"" },
            { mode = "i", keys = "<C-r>" },
            { mode = "c", keys = "<C-r>" },

            -- Window commands
            { mode = "n", keys = "<C-w>" },

            -- `z` key
            { mode = "n", keys = "z" },
            { mode = "x", keys = "z" },
        },

        clues = {
            -- Enhance this by adding descriptions for <Leader> mapping groups
            clue.gen_clues.builtin_completion(),
            clue.gen_clues.g(),
            clue.gen_clues.marks(),
            clue.gen_clues.registers(),
            clue.gen_clues.windows(),
            clue.gen_clues.z(),
        },
    })
end

return spec
