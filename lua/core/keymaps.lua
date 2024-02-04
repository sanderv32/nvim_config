vim.g.mapleader = " "
vim.g.maplocalleader = " "

local keymap = vim.keymap.set
local opts = {}

keymap('n', '<leader><left>', '<C-w><left>', opts)
keymap('n', '<leader><right>', '<C-w><right>', opts)
keymap('n', '<leader>h', '<C-w><left>', opts)
keymap('n', '<leader>l', '<C-w><right>', opts)
keymap('n', '<leader><up>', '<C-w><up>', opts)
keymap('n', '<leader><down>', '<C-w><down>', opts)
keymap('n', '<leader>k', '<C-w><up>', opts)
keymap('n', '<leader>j>', '<C-w><down>', opts)
keymap('n', '<leader>r', function() vim.o.relativenumber = not vim.o.relativenumber; end)
keymap('n', '<leader><tab>', '<cmd>bnext<cr>', opts)
keymap('n', '<leader><s-tab>', '<cmd>bprev<cr>', opts)
keymap('n', '<leader>fs', '<cmd>NvimTreeFindFileToggle<cr>', opts)

-- DAP
keymap("n", "<F32>", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", opts) -- Ctrl-F8
keymap("n", "<F5>", "<cmd>lua require'dap'.continue()<cr>", opts)
keymap("n", "<F7>", "<cmd>lua require'dap'.step_into()<cr>", opts)
keymap("n", "<F8>", "<cmd>lua require'dap'.step_over()<cr>", opts)
keymap("n", "<S-F8>", "<cmd>lua require'dap'.step_out()<cr>", opts)
keymap("n", "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>", opts)
keymap("n", "<leader>dl", "<cmd>lua require'dap'.run_last()<cr>", opts)
keymap("n", "<leader>du", "<cmd>lua require'dapui'.toggle()<cr>", opts)
keymap("n", "<F26>", "<cmd>lua require'dap'.terminate()<cr>", opts) -- Ctrl-F2

-- Custom keymaps
keymap('n', '<C-d>', '<C-d>zz', opts)
keymap('n', '<C-u>', '<C-u>zz', opts)

keymap('v', 'J', ":m '>+1<CR>gv=gv")
keymap('v', 'K', ":m '<-2<CR>gv=gv")

-- Harpoon keymappings
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")
keymap('n', '<leader>a', mark.add_file)
keymap('n', '<C-e>', ui.toggle_quick_menu)
keymap('n', '<leader>j', ui.nav_next)
keymap('n', '<leader>k', ui.nav_prev)
keymap('n', '<leader>1', function () ui.nav_file(1) end)
keymap('n', '<leader>2', function () ui.nav_file(2) end)
keymap('n', '<leader>3', function () ui.nav_file(3) end)
keymap('n', '<leader>4', function () ui.nav_file(4) end)

-- Fugitive keymappings
keymap('n', '<leader>gs', vim.cmd.Git)

-- Cody keymappings
keymap('n', '<leader>ss', "<cmd>lua require('sg.extensions.telescope').fuzzy_search_results()<CR>")
