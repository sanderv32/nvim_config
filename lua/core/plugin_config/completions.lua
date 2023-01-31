local status_ok, cmp = pcall(require, "cmp")
if not status_ok then
    return
end

require("luasnip.loaders.from_vscode").lazy_load({paths = vim.fn.stdpath('config') .. "/lua/snippets"})

require("luasnip").filetype_extend("tf", {"terraform"})

cmp.setup({
    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-o>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
    }),
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
    }, {
        { name = 'buffer' },
        { name = 'crates' },
    }),
})

local _ = require('null-ls')
require('crates').setup {
    popup = {
        autofocus = true,
    },
    null_ls = {
        enabled = true,
        name = "crates.nvim",
    },
}
