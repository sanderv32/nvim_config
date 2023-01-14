vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set('n', '<leader><left>', '<C-w><left>', {})
vim.keymap.set('n', '<leader><right>', '<C-w><right>', {})
vim.keymap.set('n', '<leader><up>', '<C-w><up>', {})
vim.keymap.set('n', '<leader><down>', '<C-w><down>', {})
vim.keymap.set('n', '<leader>r', function() vim.o.relativenumber = not vim.o.relativenumber; end)
