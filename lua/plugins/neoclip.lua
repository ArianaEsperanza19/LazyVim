-- INFO:
--[[
    NeoClip es una herramienta para manejar el portapapeles en aplicaciones modernas, permitiendo copiar,
    pegar y gestionar texto, imágenes u otros datos. Requiere:
    - Entorno compatible (APIs del sistema operativo).
    - Permisos adecuados para acceder al portapapeles.
    - Compatibilidad con el lenguaje/framework utilizado.
    - Dependencias opcionales para formatos avanzados.
    Casos de uso: Copiar/pegar texto, historial de copias, manejo de imágenes o datos estructurados.
--]]

return {
	{
		"AckslD/nvim-neoclip.lua", -- Plugin principal de neoclip
		dependencies = {
			"nvim-telescope/telescope.nvim", -- Dependencia para integración con Telescope
		},
		config = function()
			-- Cargar la extensión de neoclip en Telescope
			require("telescope").load_extension("neoclip")
			require("neoclip").setup()

			-- Atajo personalizado para abrir el historial del portapapeles con Telescope
			vim.api.nvim_set_keymap("n", "<leader>tp", ":Telescope neoclip<CR>", { noremap = true, silent = true })
		end,
	},
}
