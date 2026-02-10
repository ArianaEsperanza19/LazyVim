-- Descarga fuente bonita adecuada para todo tipo de simbolos
-- https://software.sil.org/es/charis/download/
-- https://github.com/psb1558/Junicode-font/releases

-- Modo zen
local zen_mode = false
local normal_font = "3270 Nerd Font"
local zen_font = "Junicode Cond:h15"

vim.o.guifont = normal_font

function ToggleZen()
  if not zen_mode then
    -- 1. Configuraciones de Neovim (Buffer/Window)
    vim.opt.number = false
    vim.opt.relativenumber = false
    vim.opt.laststatus = 0
    vim.opt.showtabline = 0
    vim.opt.signcolumn = "no"
    vim.opt.foldcolumn = "0"
    -- 2. Neovide: Variables de entorno (Globales)
    vim.g.neovide_line_space = 0
    vim.g.neovide_padding_top = 10
    vim.g.neovide_padding_bottom = 10
    vim.g.neovide_padding_right = 15
    vim.g.neovide_padding_left = 25

    -- 3. Fuente
    vim.o.guifont = zen_font

    zen_mode = true
    print("Modo Zen: On")
  else
    -- 1. Restaurar Neovim
    vim.opt.number = true
    vim.opt.relativenumber = true
    vim.opt.laststatus = 2
    vim.opt.showtabline = 2
    -- "auto" es mejor que "yes" para evitar saltos visuales bruscos
    vim.opt.signcolumn = "auto"

    -- 2. Restaurar Neovide
    vim.g.neovide_padding_top = 0
    vim.g.neovide_padding_bottom = 0
    vim.g.neovide_padding_right = 0
    vim.g.neovide_padding_left = 0

    -- 3. Fuente
    vim.o.guifont = normal_font

    zen_mode = false
    print("Modo Zen: Off")
  end

  -- EL TRUCO FINAL: Forzar el redibujado para que el padding sea exacto
  vim.defer_fn(function()
    vim.cmd("redraw!")
  end, 50) -- Un pequeño retraso de 50ms asegura que la fuente cargó
end

vim.keymap.set("n", "<leader>z", ToggleZen) -- Limpiado el llamado a la función
