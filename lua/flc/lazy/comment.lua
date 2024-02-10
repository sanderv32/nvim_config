return {
    'numToStr/Comment.nvim',
    opts = {
    },
    lazy = false,
    config = function ()
        local api = require('Comment.api')
        local esc = vim.api.nvim_replace_termcodes(
            '<ESC>', true, false, true
        )
        vim.keymap.set('n', '<leader>/', api.toggle.linewise.current)
        vim.keymap.set('x', '<leader>/', function ()
            vim.api.nvim_feedkeys(esc, 'nx', false)
            api.toggle.linewise(vim.fn.visualmode())
        end)
    end
}
