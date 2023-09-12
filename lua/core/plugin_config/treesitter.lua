local status_ok, treesitter_configs = pcall(require, 'nvim-treesitter.configs')
if not status_ok then
    return
end

treesitter_configs.setup {
    ensure_installed = { "c", "lua", "rust", "vim", "pioasm" },
    sync_install = false,
    auto_install = true,
    highlight = {
        enable = true,
    },
    rainbow = {
        enable = true
    }
}

vim.filetype.add {
    extension = {
        pio = "pioasm",
    }
}
