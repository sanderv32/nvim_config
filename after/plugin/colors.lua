function ColorMyPencils(color)
	local status_ok, onedark = pcall(require, "onedark")
	if status_ok then
		color = color or "onedark"
		vim.cmd.colorscheme(color)

		onedark.setup {
			style = 'warm',
			transparent = true
		}
		onedark.load()
	end

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
	vim.api.nvim_set_hl(0, "ColorColumn", { bg = "#700010" })
end

ColorMyPencils()
