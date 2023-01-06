local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
    return
end

lualine.setup({
    options = {
        theme = 'material',
    },
    sections = {
        lualine_c = {
            'lsp_progress',
        }
    }
})
