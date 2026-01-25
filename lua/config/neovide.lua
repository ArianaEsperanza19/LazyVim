-- Descarga fuente bonita adecuada para todo tipo de simbolos
-- https://software.sil.org/es/charis/download/
-- https://github.com/psb1558/Junicode-font/releases

-- Modo zen
local zen_mode = false
-- Guarda tu fuente de programación aquí para poder volver a ella
-- local normal_font = "Junicode"
local normal_font = "3270 Nerd Font"
local zen_font = "Charis" -- Ajusta el tamaño (:h) a tu gusto
vim.o.guifont = normal_font
function ToggleZen()
  if not zen_mode then
    -- Configuraciones visuales
    vim.opt.number = false
    vim.opt.relativenumber = false
    vim.opt.laststatus = 0
    vim.opt.showtabline = 0

    -- Cambio a fuente artística en Neovide
    vim.o.guifont = zen_font
    zen_mode = true
    print("Modo Zen: On")
  else
    -- Restaurar configuraciones
    vim.opt.number = true
    vim.opt.relativenumber = true -- Asumo que usas relative
    vim.opt.laststatus = 2
    vim.opt.showtabline = 2 -- O 1, según tu preferencia

    -- Volver a fuente de código
    vim.o.guifont = normal_font

    zen_mode = false
    print("Modo Zen: Off")
  end
end

vim.keymap.set("n", "<leader>z", ":lua ToggleZen()<CR>")
