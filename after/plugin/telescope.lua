local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
    return
end

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, {desc="Find files"})
vim.keymap.set('n', '<C-p>', builtin.git_files, {desc="Find in git"})
vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input("Grep > "); });
end, {desc="Find in files"})

require("telescope").setup{
    defaults = {
        file_ignore_patterns = {
            "^./target/",
        }
    },
}
