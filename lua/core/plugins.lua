local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(
    {
        function(use)
            use 'wbthomason/packer.nvim'
            use 'nvim-lua/plenary.nvim'
            use 'navarasu/onedark.nvim'
            use 'nvim-tree/nvim-tree.lua'
            use 'nvim-tree/nvim-web-devicons'
            use 'nvim-lualine/lualine.nvim'
            use 'nvim-treesitter/nvim-treesitter'
            use 'nvim-telescope/telescope.nvim'
            use 'lukas-reineke/indent-blankline.nvim'
            use 'arkav/lualine-lsp-progress'
            use 'numToStr/Comment.nvim'
            use 'simrat39/symbols-outline.nvim'
            use 'p00f/nvim-ts-rainbow'
            use 'jose-elias-alvarez/null-ls.nvim'
            use 'akinsho/toggleterm.nvim'

            -- Tabs
            use 'akinsho/bufferline.nvim'
            use 'moll/vim-bbye'

            -- completions
            use 'hrsh7th/nvim-cmp'
            use 'hrsh7th/cmp-nvim-lsp'
            use 'L3MON4D3/LuaSnip'
            use 'saadparwaiz1/cmp_luasnip'
            use 'rafamadriz/friendly-snippets'
            use 'saecki/crates.nvim'

            -- LSP
            use {
                'williamboman/mason.nvim',
                'williamboman/mason-lspconfig.nvim',
                'neovim/nvim-lspconfig',
            }

            -- DAP
            use 'mfussenegger/nvim-dap'
            use 'rcarriga/nvim-dap-ui'
            use 'ravenxrz/DAPInstall.nvim'

            -- Automatically set up your configuration after cloning packer.nvim
            -- Put this at the end after all plugins
            if packer_bootstrap then
                require('packer').sync()
            end
        end,
        config = {
            display = {
                open_fn = require('packer.util').float
            }
        }
    })
