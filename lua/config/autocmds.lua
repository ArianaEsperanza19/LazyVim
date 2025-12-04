-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")
-- Obtener la ruta de la carpeta de configuración de Neovim
local config_path = vim.fn.stdpath("config")

-- Crear un grupo de comandos automáticos para mantener el orden
vim.api.nvim_create_augroup("TemplateLoader", { clear = true })

-- Definir los comandos para cada tipo de archivo
local templates = {
  { pattern = "*.c", template = "c.tpl" },
  { pattern = "*.html", template = "html.tpl" },
  { pattern = "*.rs", template = "rs.tpl" },
  { pattern = "*.sh", template = "sh.tpl" },
  { pattern = "*.tex", template = "tex.tpl" },
}

for _, t in ipairs(templates) do
  vim.api.nvim_create_autocmd("BufNewFile", {
    group = "TemplateLoader",
    pattern = t.pattern,
    -- La función callback se ejecuta al abrir un nuevo archivo que coincida con el patrón
    callback = function()
      -- El comando '0r' lee el contenido del archivo y lo inserta en el búfer
      vim.cmd("0r " .. config_path .. "/template/" .. t.template)
    end,
    -- Asegura que el autocmd se ejecute solo una vez al abrir el archivo
    once = true,
  })
end
