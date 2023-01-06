local status_ok, nvim_terminal = pcall(require, "nvim-terminal")
if not status_ok then
    return
end

nvim_terminal.setup({
    terminals = {
        {keymap = '<leader>1'},
        {keymap = '<leader>2'},
        {keymap = '<leader>3'},
    }
})
