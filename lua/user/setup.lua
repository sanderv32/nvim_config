require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = { "sumneko_lua" }
})
require("nvim-lightbulb").setup({autocmd = {enabled = true}})
