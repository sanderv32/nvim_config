
return {
    "folke/zen-mode.nvim",
    config = function()
        vim.keymap.set("n", "<leader>zz", function()
            require("zen-mode").setup {
                window = {
                    options = {
                        cursorline = true,
                    }
                },
                plugins = {
                    tmux = {
                        enabled = true,
                    },
                    alacritty = {
                        enabled = true,
                        font = "24",
                    }
                }
            }
            require("zen-mode").toggle()
            vim.wo.wrap = false
            vim.wo.number = true
            vim.wo.rnu = true
            ColorMyPencils()
        end)


        vim.keymap.set("n", "<leader>zZ", function()
            require("zen-mode").setup {
                window = {
                    options = {
                        cursorline = true,
                    }
                },
            }
            require("zen-mode").toggle()
            vim.wo.wrap = false
            vim.wo.number = false
            vim.wo.rnu = false
            vim.opt.colorcolumn = "0"
            ColorMyPencils()
        end)
    end
}

