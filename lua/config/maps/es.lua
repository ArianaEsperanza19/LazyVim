-- La letra ñ en el teclado
vim.api.nvim_set_keymap("i", "<A-n>", "ñ", { noremap = true, silent = true })
-- Mapas para vocales acentuadas en modo inserción
vim.api.nvim_set_keymap("i", "<A-a>", "á", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<A-S-a>", "Á", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<A-e>", "é", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<A-S-e>", "É", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<A-i>", "í", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<A-S-i>", "Í", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<A-o>", "ó", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<A-S-o>", "Ó", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<C-u>", "ü", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<A-u>", "ú", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<A-S-u>", "Ú", { noremap = true, silent = true })
-- Mapeo para Control + / para insertar '¿'
vim.keymap.set("i", ".?", "¿", { noremap = true, silent = true })
