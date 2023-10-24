-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.4',
        -- or                            , branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    use {
        'loctvl842/monokai-pro.nvim',
        config = function()
            require('monokai-pro').setup()
        end
    }

    use {
        'nvim-treesitter/nvim-treesitter',
        as = 'nvim-treesitter',
        { run = ':TSUpdate' }
    }

    use {
        'mbbill/undotree',
        as = 'undotree'
    }

    use {
        'tpope/vim-fugitive',
        as = 'vim-fugitive'
    }

    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' }, -- Required
            {
                -- Optional
                'williamboman/mason.nvim',
                run = function()
                    pcall(vim.cmd, 'MasonUpdate')
                end,
            },
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },     -- Required
            { 'hrsh7th/cmp-nvim-lsp' }, -- Required
            { 'L3MON4D3/LuaSnip' },     -- Required
        }
    }

    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = false}
    }

    use {
        'gelguy/wilder.nvim',
        config = function()
        end,
        --requires = {'lambdalisue/nerdfont.vim', opt=false}
    }

    use {
        'lukas-reineke/indent-blankline.nvim'
    }

    use {
        'HiPhish/rainbow-delimiters.nvim'
    }

    use {
        'mrshmllow/document-color.nvim', config = function()
            require("document-color").setup {
                mode = "background"
            }
        end
    }

    use { "NvChad/nvim-colorizer.lua" }

    use {
        'mfussenegger/nvim-jdtls'
    }

    use {
        'mfussenegger/nvim-dap'
    }

    use {
        'rcarriga/nvim-dap-ui'
    }

    use {
        'theHamsta/nvim-dap-virtual-text'
    }

    use {
        'nvim-telescope/telescope-ui-select.nvim'
    }

    use {
        'akinsho/toggleterm.nvim',
        tag = "*"
    }

end)
