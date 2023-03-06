local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then 
        print "Waittt, bootstrapping lazy.nvim ..."
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local ok, lazy = pcall(require, 'lazy')
if not ok then return end
lazy.setup({

        -- Autopairings --
{ 
    'windwp/nvim-autopairs',
    name = 'nvim-autopairs',
    lazy = false,
    config = function()
      require("nvim-autopairs").setup()
    end
},

        -- Colorscheme --
{
        'rose-pine/neovim',
        name = 'rose-pine',
        lazy = false,
        priority = 1000,
        config = function()
                vim.cmd('colorscheme rose-pine')
        end
},

        -- lsp stuffs --
{
        'neovim/nvim-lspconfig',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-cmdline',
        'hrsh7th/nvim-cmp',
        'L3MON4D3/LuaSnip',
},

{
        
        'saadparwaiz1/cmp_luasnip',
            name = 'luasnip',
            lazy = false,
            priority = 1000,
            config = function()
                    require("plugins.config.cmp")
            end


},

        -- Bufferline --

{

    'akinsho/bufferline.nvim',
    name = 'bufferline',
    lazy = false,
    priority = 1000,
    config = function()
        require("plugins.config.bufferline")
    end
},
        -- icon pack for bufferline --
{
        'kyazdani42/nvim-web-devicons'
},

        -- Nvim tree file viewer --

{
        'nvim-tree/nvim-tree.lua',
        name = 'nvim-tree',
        lazy = false,
        config = function()
            require("plugins.config.nvim-tree")
        end
},

        -- Telescope stuffs --
{
        
        'nvim-lua/plenary.nvim',
        'alvarosevilla95/telescope.nvim',
        name = 'telescope',
        lazy = false,
        priotity = 1000,
        config = function()
                require("plugins.config.telescope")
        end
},

        -- Treesitter stuffs --
{
        'nvim-treesitter/nvim-treesitter',
        name = 'treesitter',
        lazy = false,
        config = function()
                require("plugins.config.treesitter")
        end
},

        -- Statusline (staline) --

{
        'tamton-aquib/staline.nvim',
        name = 'staline',
        lazy = false,
        config = function()
                require("plugins.config.staline")
        end
},

        -- Floating terminal --
{
        'akinsho/toggleterm.nvim',
        name = 'toggleterm',
        lazy = false,
        config = function()
                require("plugins.config.term")
        end
},

        -- gitsigns stuffs --

{
        'lewis6991/gitsigns.nvim',
        name = 'gitsigns',
        lazy = false,
        config = function()
                require("plugins.config.gitsigns")
        end
},

})

