local check_installed = function(plugin)
    local status_ok, _ = pcall(require, plugin)
    return status_ok
end

local plugins = {
    "mason",
    "mason-lspconfig",
    "lspconfig",
    "cmp_nvim_lsp",
}

for _, i in ipairs(plugins) do
    if not check_installed(i) then
        return
    end
end

require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = {
        "lua_ls",
        "rust_analyzer",
        "terraformls"
    }
})

local on_attach = function(_, _)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, {})
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {})

    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {})
    vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, {})
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
end

local capabilities = require('cmp_nvim_lsp').default_capabilities()

require("lspconfig").lua_ls.setup {
    capabilities = capabilities,
    on_attach = on_attach
}
require("lspconfig").rust_analyzer.setup {
    capabilities = capabilities,
    on_attach = on_attach
}

require("lspconfig").pyright.setup {
    capabilities = capabilities,
    on_attach = on_attach,
    filetypes = {"python"}
}

require("lspconfig").terraformls.setup {
    capabilities = capabilities,
    on_attach = on_attach
}

require("sg").setup {
    enable_cody = true,
    event = "InsertEnter",
    on_attach = on_attach
}

