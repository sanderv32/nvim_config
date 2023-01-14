local status_ok, comment = pcall(require, "Comment")
if not status_ok then
    return
end

local api = require("Comment.api")
local esc = vim.api.nvim_replace_termcodes(
    '<ESC>', true, false, true
)

vim.keymap.set('n', '<leader>/', api.toggle.linewise.current)
vim.keymap.set('x', '<leader>/', function()
    vim.api.nvim_feedkeys(esc, 'nx', false)
    api.toggle.linewise(vim.fn.visualmode())
end)

comment.setup()
