local keymap = vim.keymap.set
local opts = {
    silent = true
}

local status_ok, wk = pcall(require, "which-key")
if status_ok then
    wk.register({
        ["<leader>p"] = {
            name = "+Project"
        },
        ["<leader>pv"] = {"<cmd>NvimTreeOpen<cr>", "Goto project view"},
        ["<leader>r"] = {function()
            vim.o.relativenumber = not vim.o.relativenumber
        end, "Toggle relativenumber"}
    })
end

-- Comment
local status_ok, api = pcall(require, 'Comment.api')
if status_ok then
    local esc = vim.api.nvim_replace_termcodes('<ESC>', true, false, true)
    vim.keymap.set('n', '<leader>/', api.toggle.linewise.current)
    vim.keymap.set('x', '<leader>/', function()
        vim.api.nvim_feedkeys(esc, 'nx', false)
        api.toggle.linewise(vim.fn.visualmode())
    end)
end

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
