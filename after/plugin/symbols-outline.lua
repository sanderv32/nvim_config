local status_ok, symbols_outline = pcall(require, "symbols-outline")
if status_ok then
    symbols_outline.setup({
        position = 'left',
    })
end
