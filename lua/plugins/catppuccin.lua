return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function()
    require("catppuccin").setup({
      flavour = "mocha", -- latte, frappe, macchiato, mocha
      background = {
        light = "latte",
        dark = "mocha",
      },
      styles = {
        comments = { "italic", "bold" },
        conditionals = { "italic" },
      },
      -- AQUÍ ES DONDE SUCEDE LA MAGIA
      custom_highlights = function(colors)
        return {
          -- Cambiamos el color de los comentarios.
          -- 'colors.teal' es muy visible, pero puedes usar 'colors.rosewater' o 'colors.lavender'
          Comment = { fg = colors.lavender },
          -- Cambia el color de la línea donde está el cursor para que resalte más
          CursorLine = { bg = colors.surface0 },
          -- Si tu terminal permite que Neovim controle el color del cursor:
          Cursor = { fg = colors.crust, bg = colors.mauve },
          TermCursor = { fg = colors.crust, bg = colors.mauve },
        }
      end,
    })

    -- No olvides cargar el tema después de la configuración
    vim.cmd.colorscheme("catppuccin")
  end,
}
