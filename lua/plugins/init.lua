local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
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
  { 
    'windwp/nvim-autopairs',
    name = 'nvim-autopairs',
    lazy = false,
    config = function()
      require("nvim-autopairs").setup()
    end
},

--{
--        'nyoom-engineering/oxocarbon.nvim',
--        name = 'oxocarbon',
--        lazy = false,
--        priority = 1000,
--        config = function()
--                vim.cmd('colorscheme oxocarbon')
--        end
--},

{
        'rose-pine/neovim',
        name = 'rose-pine',
        lazy = false,
        priority = 1000,
        config = function()
                vim.cmd('colorscheme rose-pine')
        end
},


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
                    require("plugins.config.cmp-config")
            end


},

{

    'akinsho/bufferline.nvim',
    name = 'bufferline',
    lazy = false,
    priority = 1000,
    config = function()
        require("plugins.config.bufferline")
    end
},

{
        'kyazdani42/nvim-web-devicons'
},

{
        'nvim-tree/nvim-tree.lua',
        name = 'nvim-tree',
        lazy = false,
        config = function()
            require("plugins.config.nvim-tree")
        end
},

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

{
        'nvim-lualine/lualine.nvim',
        name = 'lualine',
        lazy = false,
        priotity = 1000,
        config = function()
                require("plugins.config.lualine")
        end
},


{
        'nvim-treesitter/nvim-treesitter',
        name = 'treesitter',
        lazy = false,
        priotity = 1000,
        config = function()
                require("plugins.config.treesitter")
        end
},


      -- cmp sources pluging 



})

