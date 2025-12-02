-- Autodetección de archivos Typst
vim.filetype.add({
	extension = {
		typ = "typst",
	},
})

-- Opcional: Si quieres forzar la configuración para el cliente LSP
vim.cmd([[autocmd BufNewFile,BufRead *.typ set filetype=typst]])
