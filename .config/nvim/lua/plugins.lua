return require('packer').startup(function(use)

    use 'wbthomason/packer.nvim'

    -- themes
    use 'Mofiqul/dracula.nvim'
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons' }
    }
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.4',
        requires = { {'nvim-lua/plenary.nvim'} }
    }
    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
        local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
        ts_update()
        end,
    }

    use {
        'VonHeikemen/lsp-zero.nvim',
        requires = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},
            {'williamboman/mason.nvim'},
            {'williamboman/mason-lspconfig.nvim'},

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},
            {'hrsh7th/cmp-buffer'},
            {'hrsh7th/cmp-path'},
            {'saadparwaiz1/cmp_luasnip'},
            {'hrsh7th/cmp-nvim-lsp'},
            {'hrsh7th/cmp-nvim-lua'},
            {'hrsh7th/cmp-cmdline'},

            -- Snippets
            {'L3MON4D3/LuaSnip'},
            {'rafamadriz/friendly-snippets'},

        }
    }

    use 'mfussenegger/nvim-lint' --linting
    --formatting
    use 'mhartington/formatter.nvim'

    -- Git related plugins
    use 'tpope/vim-fugitive'
    use 'lewis6991/gitsigns.nvim'

    use 'lukas-reineke/indent-blankline.nvim' -- Add indentation guides even on blank lines
    use {
        'numToStr/Comment.nvim', -- comment with gc
        config = function()
            require('Comment').setup()
        end
    }

    --terminal
    use 'kassio/neoterm'

    -- sql
    use 'tpope/vim-dadbod'
    use 'kristijanhusak/vim-dadbod-completion'

    use "windwp/nvim-autopairs"

end)
