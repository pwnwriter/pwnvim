-- Bootstrap lazy.nvim if not already

local function bootstrapLazyNvim()
    local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
    if not vim.loop.fs_stat(lazypath) then
        print("Waittt, bootstrapping lazy.nvim ...")
        vim.fn.system(
            {
                "git",
                "clone",
                "--filter=blob:none",
                "https://github.com/folke/lazy.nvim.git",
                "--branch=stable", -- latest stable release
                lazypath
            }
        )
    end
    vim.opt.rtp:prepend(lazypath)
end

bootstrapLazyNvim()

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
            event = "InsertEnter",
            config = function()
                require("config.cmp")
            end
        },

        -- Bufferline --
        {
            "akinsho/bufferline.nvim",
            name = "bufferline",
            lazy = false,
            event = "BufWinEnter",
            dependencies = "kyazdani42/nvim-web-devicons",
            config = function()
                require("config.bufferline")
            end
        },

        -- Nvim tree file viewer --
        {
            "nvim-tree/nvim-tree.lua",
            name = "nvim-tree",
            lazy = false,
            cmd = {"NvimTreeToggle", "NvimTreeFocus"},
            config = function()
                require("config.nvim-tree")
            end
        },

        -- Telescope stuffs --
        {
            "alvarosevilla95/telescope.nvim",
            name = "telescope",
            lazy = false,
            dependencies = "nvim-lua/plenary.nvim",
            config = function()
                require("telescope").setup {}
            end
        },

        -- Treesitter stuffs --
        {
            "nvim-treesitter/nvim-treesitter",
            name = "treesitter",
            lazy = false,
            event = "BufWinEnter",
            cmd = {"TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo"},
            build = ":TSUpdate",
            config = function()
                require("config.treesitter")
            end
        },

        -- Statusline (staline) --
        {
            "tamton-aquib/staline.nvim",
            name = "staline",
            lazy = false,
	    event = { "BufReadPre", "BufNew" },
            config = function()
                require("config.staline")
            end
        },

        -- gitsigns stuffs --
        {
            "lewis6991/gitsigns.nvim",
            name = "gitsigns",
            lazy = true,
            ft = "gitcommit",
            init = function()
                -- Load gitsigns only when a git file is opened
                vim.api.nvim_create_autocmd(
                    {"BufRead"},
                    {
                        group = vim.api.nvim_create_augroup("GitSignsLazyLoad", {clear = true}),
                        callback = function()
                            vim.fn.system("git -C " .. vim.fn.expand("%:p:h") .. " rev-parse")
                            if vim.v.shell_error == 0 then
                                vim.api.nvim_del_augroup_by_name("GitSignsLazyLoad")
                                require("config.gitsigns") -- Load gitsigns configuration
                            end
                        end
                    }
                )
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
        }
    }
)

