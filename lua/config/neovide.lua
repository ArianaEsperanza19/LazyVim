-- Descarga fuente bonita adecuada para todo tipo de simbolos
-- https://software.sil.org/es/charis/download/
-- https://github.com/psb1558/Junicode-font/releases

-- Modo zen
zen_mode = false
local normal_font = "3270 Nerd Font"
-- local zen_font = "Junicode Cond:h15"
local zen_font = "Charis:h15"
-- local zen_font = "Gentium Plus:h14"

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
    -- 4. Atajos de teclado especificos
    require("config.maps.eo").enable_esperanto()
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
    -- 4.Atajos de teclado desactivados
    require("config.maps.eo").disable_esperanto()
    zen_mode = false
    print("Modo Zen: Off")
  end

  -- Forzar el redibujado para que el padding sea exacto
  vim.defer_fn(function()
    vim.cmd("redraw!")
  end, 50) -- Un pequeño retraso de 50ms asegura que la fuente cargó
end

-- Función para cambiar el tamaño de la fuente
local function change_font_size(delta)
  -- Obtenemos la fuente actual (ejemplo: "Charis SIL:h14")
  local current_font = vim.o.guifont

  -- Usamos un patrón para encontrar el número después de ":h"
  local name, size = current_font:match("([^:]+):h(%d+)")

  if name and size then
    local new_size = tonumber(size) + delta
    -- Establecemos un límite mínimo de tamaño (ej. 6)
    if new_size >= 6 then
      vim.o.guifont = name .. ":h" .. new_size
    end
  end
end

-- Atajos de teclado
-- Control + "+" para agrandar (usamos "=" porque suele ser la misma tecla)
vim.keymap.set({ "n", "i", "v" }, "<C-=>", function()
  change_font_size(1)
end, { desc = "Agrandar zoom" })
vim.keymap.set({ "n", "i", "v" }, "<C-->", function()
  change_font_size(-1)
end, { desc = "Encoger zoom" })

-- Opcional: Control + MouseWheel para zoom (muy útil en Neovide)
vim.keymap.set({ "n", "i", "v" }, "<C-ScrollWheelUp>", function()
  change_font_size(1)
end)
vim.keymap.set({ "n", "i", "v" }, "<C-ScrollWheelDown>", function()
  change_font_size(-1)
end)
vim.keymap.set("n", "<leader>z", ToggleZen) -- Limpiado el llamado a la función
