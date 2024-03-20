return require("packer").startup(function (use)
    use 'wbthomason/packer.nvim'

    use{
        'nvim-telescope/telescope.nvim', tag = '0.1.5',
        requires = {'nvim-lua/plenary.nvim'}
    }

    use 'ellisonleao/gruvbox.nvim'

    use {'nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'}}

    use 'theprimeagen/harpoon'

    use 'mbbill/undotree'

    --use {
        --    "folke/trouble.nvim",
        --    requires = { "nvim-tree/nvim-web-devicons" }
        --}
    use {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/nvim-cmp",
        "L3MON4D3/LuaSnip",
        "rafamadriz/friendly-snippets",
        "saadparwaiz1/cmp_luasnip",
        "j-hui/fidget.nvim",
    }

    --use 'simrat39/rust-tools.nvim'

    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons', -- optional
        },
    }

    use "lukas-reineke/indent-blankline.nvim"

    use {
        'nvim-lualine/lualine.nvim',
        requires = {
            'nvim-tree/nvim-web-devicons',
            opt = true
        }
    }

    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }

end)
