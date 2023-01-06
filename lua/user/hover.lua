local status_ok, hover = pcall(require, "hover")
if not status_ok then
    return
end

hover.setup {
    init = function()
        require("hover.provider.lsp")
    end,
}
