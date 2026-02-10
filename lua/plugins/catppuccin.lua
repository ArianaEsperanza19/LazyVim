return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function()
    require("catppuccin").setup({
      flavour = "latte", -- latte, frappe, macchiato, mocha
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
          -- Comment = { fg = colors.lavender },
        }
      end,
    })

    -- No olvides cargar el tema después de la configuración
    vim.cmd.colorscheme("catppuccin")
  end,
}
