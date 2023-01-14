local status_ok, builtin = pcall(require, "telescope.builtin")
if not status_ok then
    return
end

vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<leader><Space>', builtin.oldfiles, {})
vim.keymap.set('n', '<leader>pg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>ph', builtin.help_tags, {})
