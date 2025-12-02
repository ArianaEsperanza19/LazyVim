--INFO: Minty is a color scheme for neovim that get easier the change of colors in the editor of css.

return {
	"nvzone/minty",
	cmd = { "Shades", "Huefy" }, -- Comandos principales del plugin
	dependencies = { "nvzone/volt" }, -- Dependencia necesaria
	config = function()
		-- Configuración del plugin
		require("minty").setup()
	end,
}
