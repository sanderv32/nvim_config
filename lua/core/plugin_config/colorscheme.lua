vim.o.termguicolors = true

local status_ok, onedark = pcall(require, "onedark")
if not status_ok then
    return
end

onedark.setup {
    style = "warm",
    transparant = true,
}
onedark.load()

vim.api.nvim_set_hl(0, "ColorColumn", { bg = "#700010" })
