local fn = vim.fn
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system {"git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim",
                                  install_path}
    print "Installing packer close and reopen Neovim..."
    vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
]]

local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

packer.init {
    display = {
        open_fn = function()
            return require("packer.util").float {
                border = "rounded"
            }
        end
    }
}

return require('packer').startup(function(use)
    -- Packer can manage itself
    use {
        'wbthomason/packer.nvim',
        commit = "dac4088c70f4337c6c40d1a2751266a324765797"
    } -- Packer can manage itself
    use {
        'nvim-tree/nvim-web-devicons',
        commit = "05e1072f63f6c194ac6e867b567e6b437d3d4622"
    }
    use {
        'nvim-lua/plenary.nvim',
        commit = "4b7e52044bbb84242158d977a50c4cbcd85070c7"
    }
    use {
        'nvim-telescope/telescope.nvim',
        commit = "b79cd6c88b3d96b0f49cb7d240807cd59b610cd8"
    }
    use {'navarasu/onedark.nvim'}
    use {'nvim-treesitter/nvim-treesitter'}
    use {'p00f/nvim-ts-rainbow'}
    use {'theprimeagen/harpoon'}
    use {'lukas-reineke/indent-blankline.nvim'}
    use {'akinsho/bufferline.nvim'}
    use {'moll/vim-bbye'}
    use {'antoinemadec/FixCursorHold.nvim'}
    use {'kosayoda/nvim-lightbulb'}

    -- LSP Support
    use {'neovim/nvim-lspconfig'}
    use {'williamboman/mason.nvim'}
    use {'williamboman/mason-lspconfig.nvim'}
    use {'williamboman/nvim-lsp-installer'}
    use {'jose-elias-alvarez/null-ls.nvim'}
    use {'RRethy/vim-illuminate'}

    -- cmp plugins
    use {'hrsh7th/nvim-cmp'}
    use {'hrsh7th/cmp-buffer'}
    use {'hrsh7th/cmp-path'}
    use {'saadparwaiz1/cmp_luasnip'}
    use {'hrsh7th/cmp-nvim-lsp'}
    use {'hrsh7th/cmp-nvim-lua'}

    -- Snippets
    use {'L3MON4D3/LuaSnip'}
    use {'rafamadriz/friendly-snippets'}

    -- DAP
    use {'mfussenegger/nvim-dap'}
    use {'rcarriga/nvim-dap-ui'}
    use {'ravenxrz/DAPInstall.nvim'}

    use {'arkav/lualine-lsp-progress'}
    use {'nvim-lualine/lualine.nvim'}
    use {'simrat39/symbols-outline.nvim'}
    use {'simrat39/rust-tools.nvim'}
    use {'s1n7ax/nvim-terminal'}
    use {"folke/trouble.nvim"}
    use {'nvim-tree/nvim-tree.lua'}
    use {'folke/which-key.nvim'}
    use {'numToStr/Comment.nvim'}
    use {'JoosepAlviste/nvim-ts-context-commentstring'}
    use {'startup-nvim/startup.nvim'}
    use {'lewis6991/hover.nvim'}

    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)

