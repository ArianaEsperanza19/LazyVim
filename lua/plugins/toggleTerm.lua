-- INFO: toggleTerm: un plugin de Neovim que permite abrir y cerrar un terminal flotante en la ventana actual.
-- Permite ejecutar comandos y programas en un entorno de terminal dentro de Neovim,
-- sin necesidad de salir de la aplicación.
-- toggleTerm se puede abrir y cerrar utilizando una combinación de teclas personalizable,
-- y se puede configurar para que aparezca en diferentes posiciones y tamaños en la ventana.
-- También se pueden agregar estilos y personalizaciones adicionales para mejorar la apariencia del terminal.
-- Algunas de las características clave de toggleTerm incluyen:
--  * Abrir y cerrar el terminal flotante con una combinación de teclas personalizable.
--  * Configurar el tamaño y la posición del terminal flotante en la ventana.
--  * Agregar estilos y personalizaciones adicionales para mejorar la apariencia del terminal.
--  * Ejecutar comandos y programas en un entorno de terminal dentro de Neovim.

return {
	{
		"akinsho/toggleterm.nvim", -- Plugin principal de ToggleTerm
		version = "*", -- Usa la última versión disponible
		config = function()
			-- Configuración principal de ToggleTerm
			require("toggleterm").setup({
				direction = "float", -- Configura el terminal flotante para que aparezca en el centro de la pantalla
				float_opts = {
					border = "single", -- Agrega un borde sencillo alrededor del terminal flotante
					winblend = 10, -- Ajusta la transparencia del terminal flotante
					highlights = {
						border = "FloatBorder", -- Agrega un color de borde al terminal flotante
						background = "FloatBackground", -- Agrega un color de fondo al terminal flotante
					},
				},
				open_mapping = [[<C-\>]], -- Abre/cierra el terminal con Ctrl + \
				hide_numbers = true,
				shade_filetypes = {},
				autochdir = true,
				close_on_exit = true, -- Cierra el terminal cuando el proceso termina
			})

			-- Función para ejecutar el archivo actual con detección de archivos
			function run_current_file()
				local file_path = vim.api.nvim_buf_get_name(0)
				local file_extension = file_path:match("^.+(%..+)$")

				local cmd
				if file_extension == ".c" then
					-- Si es un archivo .c, compilar y ejecutar
					local file_name = vim.fn.fnamemodify(file_path, ":r")
					cmd = string.format("gcc %s -o %s && %s", file_path, file_name, file_name)
				elseif file_extension == ".rs" then
					-- Si es un archivo .rs, compilar y ejecutar con rustc
					local file_name = vim.fn.fnamemodify(file_path, ":r")
					cmd = string.format("rustc %s -o %s && %s", file_path, file_name, file_name)
				elseif file_extension == ".php" then
					-- Si es un archivo .php, ejecutarlo con el intérprete de php
					cmd = string.format("php %s", file_path)
				elseif file_extension == ".js" then
					-- Si es un archivo .js, ejecutarlo con el intérprete de node
					cmd = string.format("node %s", file_path)
				elseif file_extension == ".py" then
					-- Si es un archivo .js, ejecutarlo con el intérprete de node
					cmd = string.format("python3 %s", file_path)
				elseif file_extension == ".sh" then
					-- Si es un archivo .sh, ejecutarlo con bash
					cmd = string.format("bash %s", file_path)
				elseif file_extension == ".lua" then
					-- Si es un archivo .lua, ejecutarlo con lua
					cmd = string.format("lua %s", file_path)
				elseif file_extension == ".py" then
					-- Si es un archivo .py, ejecutarlo con python
					cmd = string.format("python %s", file_path)
				else
					-- Para otros tipos de archivos, simplemente mostrar un mensaje
					vim.notify("Formato de archivo no soportado", vim.log.levels.WARN)
					return
				end

				-- Crear una nueva terminal para ejecutar el comando
				local Terminal = require("toggleterm.terminal").Terminal
				local run_file = Terminal:new({
					cmd = cmd,
					direction = "float",
					close_on_exit = false,
					on_open = function(term)
						vim.cmd("startinsert!") -- Iniciar en modo inserción
					end,
				})
				run_file:toggle()
			end

			-- Mapeos para abrir y cerrar ToggleTerm Flotante
			vim.api.nvim_set_keymap("n", "<C-\\>", ":ToggleTerm<CR>", { noremap = true, silent = true })
			vim.api.nvim_set_keymap("n", "<leader>rr", ":lua run_current_file()<CR>", { noremap = true, silent = true })

			-- Función para alternar una terminal vanilla en un buffer
			function CMDTerminal()
				if vim.bo.buftype == "terminal" then
					vim.cmd("stopinsert") -- Salir del modo inserción si estamos en una terminal
				else
					vim.cmd("enew | terminal") -- Crear una nueva terminal en el buffer actual
				end
			end

			-- Función para cerrar el buffer si estamos en una terminal
			function CloseTerminalIfActive()
				if vim.bo.buftype == "terminal" then
					vim.cmd("bdelete!") -- Cerrar el buffer actual
				else
					vim.cmd("stopinsert") -- Salir del modo inserción si no estamos en una terminal
				end
			end

			-- Mapeos para la terminal vanilla
			vim.api.nvim_set_keymap("n", "<leader>\\", ":lua CMDTerminal()<CR>", { noremap = true, silent = true })
			vim.api.nvim_set_keymap(
				"n",
				"<leader>xv",
				":ToggleTerm size=60 dir=~/Desktop direction=vertical name=TerminalVertical<CR>",
				{ noremap = true, silent = true }
			)
			vim.api.nvim_set_keymap(
				"n",
				"<leader>xh",
				":ToggleTerm size=15 dir=~/Desktop direction=horizontal name=TerminalHorizontal<CR>",
				{ noremap = true, silent = true }
			)
			vim.api.nvim_set_keymap(
				"t",
				"<Esc>",
				"<C-\\><C-n>:lua CloseTerminalIfActive()<CR>",
				{ noremap = true, silent = true }
			)
		end,
	},
}
