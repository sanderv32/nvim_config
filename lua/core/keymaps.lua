vim.g.mapleader = " "
vim.g.maplocalleader = " "

local keymap = vim.keymap.set
local opts = {}

keymap('n', '<leader><left>', '<C-w><left>', opts)
keymap('n', '<leader><right>', '<C-w><right>', opts)
keymap('n', '<leader><up>', '<C-w><up>', opts)
keymap('n', '<leader><down>', '<C-w><down>', opts)
keymap('n', '<leader>r', function() vim.o.relativenumber = not vim.o.relativenumber; end)

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
