local status_ok, indent_blankline = pcall(require, "indent_blankline")
if not status_ok then
    return
end

vim.cmd [[highlight IndentBlanklineIndent1 guibg=#3b3b36 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent2 guibg=#313b3a gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent3 guibg=#373342 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent4 guibg=#2f3941 gui=nocombine]]

indent_blankline.setup {
    space_char_blankline = " ",
    show_current_context_start = true,
    show_trailing_blankline_indent = false,
    show_first_indent_level = true,
    use_treesitter = true,
    show_current_context = true,
    buftype_exclude = { "terminal", "nofile" },
    filetype_exclude = {
        "help",
        "packer",
        "NvimTree",
    },
    char_highlight_list = {
        "IndentBlanklineIndent1",
        "IndentBlanklineIndent2",
        "IndentBlanklineIndent3",
        "IndentBlanklineIndent4",
    },
    space_char_highlight_list = {
        "IndentBlanklineIndent1",
        "IndentBlanklineIndent2",
        "IndentBlanklineIndent3",
        "IndentBlanklineIndent4",
    },
}
