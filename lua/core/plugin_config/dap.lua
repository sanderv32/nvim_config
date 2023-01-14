local dap_status_ok, dap = pcall(require, "dap")
if not dap_status_ok then
    return
end

local dap_ui_status_ok, dapui = pcall(require, "dapui")
if not dap_ui_status_ok then
    return
end

local dap_install_status_ok, dap_install = pcall(require, "dap-install")
if not dap_install_status_ok then
    return
end

dap_install.setup {}

dap_install.config("python", {})
dap_install.config("codelldb", {})

dapui.setup {
    layouts = { {
        elements = { 'scopes', 'breakpoints' },
        size = 0.25,
        position = "right"
    } }
}

vim.fn.sign_define("DapBreakpoint", {
    text = "",
    texthl = "DiagnosticSignError",
    linehl = "",
    numhl = ""
})

dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
end

dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
end

dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
end

dap.set_log_level("TRACE")

dap.adapters.lldb = {
    type = 'executable',
    command = '/Users/averhaar/.cargo/bin/rust-lldb',
    name = 'lldb'
}

dap.adapters.codelldb = {
    type = 'server',
    name = 'codelldb',
    host = '127.0.0.1',
    port = 13000,
    executable = {
        command = '/Users/averhaar/.vscode-oss/extensions/vadimcn.vscode-lldb-1.8.1/adapter/codelldb',
        args = { '--port', '13000' }
    }
}

dap.configurations.rust = { {
    name = 'Launch Debug',
    type = 'codelldb',
    request = 'launch',
    program = function()
        return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/target/debug/' .. '')
    end,
    cwd = "${workspaceFolder}",
    stopOnEntry = false,
    args = {},
    initCommand = {},
    runInTerminal = false
} }
