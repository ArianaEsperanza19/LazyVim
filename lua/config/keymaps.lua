vim.keymap.set("n", "<leader>h", ":nohlsearch<CR>")
vim.api.nvim_set_keymap("n", "s", "s", { noremap = true, silent = true })
-- Asignar <leader>left para ir al principio de la línea
vim.api.nvim_set_keymap("n", "<leader>,", "^", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<leader>,", "^", { noremap = true, silent = true })
-- Asignar <leader>right para ir al final de la línea
vim.api.nvim_set_keymap("n", "<leader>.", "$", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<leader>.", "$", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-o>", "<C-u>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-l>", "<C-d>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<C-o>", "<C-u>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<C-l>", "<C-d>", { noremap = true, silent = true })

-- Movimiento entre ventanas con <leader>w + hjkl
vim.api.nvim_set_keymap("n", "<C-left>", "<C-w>h", { noremap = true, silent = true }) -- Ventana izquierda
vim.api.nvim_set_keymap("n", "<C-down>", "<C-w>j", { noremap = true, silent = true }) -- Ventana inferior
vim.api.nvim_set_keymap("n", "<C-up>", "<C-w>k", { noremap = true, silent = true }) -- Ventana superior
vim.api.nvim_set_keymap("n", "<C-right>", "<C-w>l", { noremap = true, silent = true }) -- Ventana derecha
-- Abrir horizontal
vim.api.nvim_set_keymap("n", "<leader>wh", "<C-w>s", { noremap = true, silent = true })
-- Cerrar ventanas inactivas
vim.api.nvim_set_keymap("n", "<leader>wq", ":only<CR>", { noremap = true, silent = true })
-- Cerrar buffer actual con todo
vim.api.nvim_set_keymap("n", "<leader><Del>", ":windo bd<CR>", { noremap = true, silent = true })

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
vim.api.nvim_set_keymap("i", "<C-e>", "ĕ", { noremap = true, silent = true })
-- Mapeo para Control + / para insertar '¿'
-- vim.api.nvim_set_keymap("i", "<C-i>", "¿", { noremap = true, silent = true })
-- Crear una nueva línea debajo de la línea actual sin cambiar de modo
vim.api.nvim_set_keymap("n", "<leader>o", "o<Esc>", { noremap = true, silent = true })
-- Crear una nueva línea encima de la línea actual sin cambiar de modo
vim.api.nvim_set_keymap("n", "<leader>O", "O<Esc>", { noremap = true, silent = true })
-- Mover línea o selección hacia arriba con `m+Up`
vim.api.nvim_set_keymap("n", "m<Up>", ":m .-2<CR>==", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "m<Up>", ":m '<-2<CR>gv=gv", { noremap = true, silent = true })
-- Mover línea o selección hacia abajo con `m+Down`
vim.api.nvim_set_keymap("n", "m<Down>", ":m .+1<CR>==", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "m<Down>", ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
-- Remapear <leader>j para moverse visualmente hacia abajo una línea
vim.api.nvim_set_keymap("n", "<leader>j", "gj", { noremap = true, silent = true })
-- Remapear <leader>k para moverse visualmente hacia arriba una línea
vim.api.nvim_set_keymap("n", "<leader>k", "gk", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "zj", ":bprevious<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "zk", ":bnext<CR>", { noremap = true, silent = true })

-- Aliases
local map = vim.api.nvim_set_keymap
local default_opt = { noremap = true, silent = true }

-- Bloquear flechas fuera del modo insertar
map("", "<up>", "<nop>", { noremap = true })
map("", "<down>", "<nop>", { noremap = true })
map("", "<left>", "<nop>", { noremap = true })
map("", "<right>", "<nop>", { noremap = true })

require("config.plugins_maps")
