local ok, lazy = pcall(require, "lazy")
if not ok then
    return
end

lazy.setup(
    {
        -- Autopairings --
        {
            "windwp/nvim-autopairs",
            name = "nvim-autopairs",
            lazy = false,
            config = function()
                require("nvim-autopairs").setup()
            end
        },

        -- catppuccin colorscheme
        {
            "catppuccin/nvim",
            name = "catppuccin",
            lazy = false,
            config = function()
                vim.cmd("colorscheme catppuccin-mocha")
            end
        },
        -- lsp stuffs --
        {
            "neovim/nvim-lspconfig",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
            "hrsh7th/nvim-cmp",
            "L3MON4D3/LuaSnip"
        },
        {
            "saadparwaiz1/cmp_luasnip",
            name = "luasnip",
            lazy = false,
            config = function()
                require("plugins.config.cmp")
            end
        },
        -- Bufferline --

        {
            "akinsho/bufferline.nvim",
            name = "bufferline",
            lazy = false,
            config = function()
                require("plugins.config.bufferline")
            end
        },
        -- icon pack for bufferline --
        {
            "kyazdani42/nvim-web-devicons"
        },
        -- Nvim tree file viewer --

        {
            "nvim-tree/nvim-tree.lua",
            name = "nvim-tree",
            lazy = false,
            config = function()
                require("plugins.config.nvim-tree")
            end
        },

        -- Telescope stuffs --

        {
            "nvim-lua/plenary.nvim"
        },
        {
            "alvarosevilla95/telescope.nvim",
            name = "telescope",
            lazy = false,
            config = function()
                require("telescope").setup {}
            end
        },

        -- Treesitter stuffs --
        
        {
            "nvim-treesitter/nvim-treesitter",
            name = "treesitter",
            lazy = false,
            config = function()
                require("plugins.config.treesitter")
            end
        },
        -- Statusline (staline) --

        {
            "tamton-aquib/staline.nvim",
            name = "staline",
            lazy = false,
            config = function()
                require("plugins.config.staline")
            end
        },
        -- gitsigns stuffs --

        {
            "lewis6991/gitsigns.nvim",
            name = "gitsigns",
            lazy = false,
            config = function()
                require("plugins.config.gitsigns")
            end
        },
        -- Nvterm (terminal)
        {
            "NvChad/nvterm",
            name = "nvterm",
            lazy = false,
            config = function()
                require("nvterm").setup {}
            end
        },
        
    }
)

