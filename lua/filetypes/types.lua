-- Autodetección de archivos Typst
vim.filetype.add({
  extension = {
    typ = "typst",
    rst = "rust",
  },
})

-- Opcional: Si quieres forzar la configuración para el cliente LSP
vim.cmd([[autocmd BufNewFile,BufRead *.typ set filetype=typst]])
vim.cmd([[autocmd BufRead,BufNewFile *.rst set filetype=rust]])
