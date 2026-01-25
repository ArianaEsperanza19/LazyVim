-- Autodetección de archivos Typst
vim.filetype.add({
  extension = {
    typ = "typst",
    rst = "rust",
    ag = "aguila",
    aguila = "aguila",
  },
})

-- Opcional: Si quieres forzar la configuración para el cliente LSP
vim.cmd([[autocmd BufNewFile,BufRead *.typ set filetype=typst]])
vim.cmd([[autocmd BufRead,BufNewFile *.rst set filetype=rust]])

-- Configuracion de Aguila
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = { "*.ag", "*.aguila" },
  command = "set filetype=aguila",
})
-- Una vez que el filetype es 'aguila', le pedimos los colores de C
vim.api.nvim_create_autocmd("FileType", {
  pattern = "aguila",
  callback = function()
    vim.treesitter.start(0, "c")
  end,
})
