--INFO: Its a plugin that provides easy and efficient ways to add, change, and delete surrounding characters or tags in text.
return {
  {
    "kylechui/nvim-surround", -- Plugin principal de nvim-surround
    keys = { "]n", "]y", "]Y", "]v", "]V", "]x", "]/" },
    event = "VeryLazy", -- Cargar el plugin de manera diferida
    config = function()
      -- Configuración principal de nvim-surround

      vim.g.nvim_surround_no_normal_mappings = true
      vim.keymap.set("n", "]n", "<Plug>(nvim-surround-normal)", {
        desc = "Add a surrounding pair around a motion (normal mode)",
      })
      vim.keymap.set("x", "]v", "<Plug>(nvim-surround-visual)", {
        desc = "Add a surrounding pair around a motion (visual selection)",
      })
      vim.keymap.set("x", "]V", "<Plug>(nvim-surround-visual-line)", {
        desc = "Add a surrounding pair around a visual selection, on new lines",
      })
      vim.keymap.set("n", "]x", "<Plug>(nvim-surround-delete)", {
        desc = "Delete a surrounding pair",
      })
      vim.keymap.set("n", "]/", "<Plug>(nvim-surround-change)", {
        desc = "Change a surrounding pair",
      })
      require("nvim-surround").setup({
        surrounds = {
          ["("] = {
            add = function()
              return { { "(" }, { ")" } }
            end,
          },
          ["["] = {
            add = function()
              return { { "[" }, { "]" } }
            end,
          },
          ["{"] = {
            aliasesdd = function()
              return { { "{" }, { "}" } }
            end,
          },
          ["<"] = {
            aliasesdd = function()
              return { { "<" }, { ">" } }
            end,
          },
          ['"'] = {
            aliasesdd = function()
              return { { '"' }, { '"' } }
            end,
          },
          ["'"] = {
            aliasesdd = function()
              return { { "'" }, { "'" } }
            end,
          },
          ["`"] = {
            aliasesdd = function()
              return { { "`" }, { "`" } }
            end,
          },
          ["@"] = {
            add = function()
              return { "```", "```" }
            end,
          },
          -- Negrita markdown
          ["n"] = {
            add = function()
              return { "**", "**" }
            end,
          },
          ["k"] = {
            add = function()
              return { "_", "_" }
            end,
          },
          ["s"] = {
            add = function()
              return { "~~", "~~" }
            end,
          },
          ["l"] = {
            add = function()
              return { "==", "==" }
            end,
            target = { "==", "==" },
            command = { "==", "==" },
          },
          ["?"] = {
            add = function()
              return { "¿", "?" }
            end,
            delete = function()
              return require("nvim-surround.config").get_selections({
                char = "?",
                pattern = "^(¿)().-(?)()$",
              })
            end,
            change = function()
              return { "¿", "?" }
            end,
          },
          ["!"] = {
            add = function()
              return { "¡", "!" }
            end,
          },
        },
        aliases = {
          -- ["a"] = ">",
          -- ["b"] = ")",
          -- ["B"] = "}",
          -- ["r"] = "]",
          -- ["q"] = { '"', "'", "`" },
          -- ["s"] = { "}", "]", ")", ">", '"', "'", "`" },
        },
      })
    end,
  },
}
