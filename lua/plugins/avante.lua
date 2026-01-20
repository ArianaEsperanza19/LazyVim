--INFO: Avante is a plugin for Neovim that integrates AI-powered code assistance and chat functionality directly
--into the editor.
return {
  "yetone/avante.nvim",
  build = vim.fn.has("win32") ~= 0 and "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false"
    or "make",
  event = "VeryLazy",
  opts = {
    -- 1. CAMBIO CLAVE: El proveedor ahora es "ollama" directamente
    provider = "ollama",

    providers = {
      ollama = {
        -- 2. IMPORTANTE: Sin "/v1" al final
        endpoint = "http://127.0.0.1:11434",
        model = "qwen2.5-coder",
        -- Parámetros recomendados para evitar bucles
        extra_request_body = {
          options = {
            temperature = 0.2,
            num_predict = 1024, -- Límite de tokens para que no genere infinito
          },
        },
      },
    },

    selection = {
      hint_display = "none",
    },
    behaviour = {
      auto_set_keymaps = false,
      auto_apply_diff_after_generation = false,
      support_paste_from_clipboard = false,
    },
  },
  cmd = {
    "AvanteAsk",
    "AvanteBuild",
    "AvanteChat",
    "AvanteClear",
    "AvanteEdit",
    "AvanteFocus",
    "AvanteHistory",
    "AvanteModels",
    "AvanteRefresh",
    "AvanteShowRepoMap",
    "AvanteStop",
    "AvanteSwitchProvider",
    "AvanteToggle",
  },
  keys = {
    { "<leader>aa", "<cmd>AvanteAsk<CR>", desc = "Ask Avante" },
    { "<leader>ac", "<cmd>AvanteChat<CR>", desc = "Chat with Avante" },
    { "<leader>ae", "<cmd>AvanteEdit<CR>", desc = "Edit Avante" },
    { "<leader>af", "<cmd>AvanteFocus<CR>", desc = "Focus Avante" },
    { "<leader>ah", "<cmd>AvanteHistory<CR>", desc = "Avante History" },
    { "<leader>am", "<cmd>AvanteModels<CR>", desc = "Select Avante Model" },
    { "<leader>an", "<cmd>AvanteChatNew<CR>", desc = "New Avante Chat" },
    { "<leader>ap", "<cmd>AvanteSwitchProvider<CR>", desc = "Switch Avante Provider" },
    { "<leader>ar", "<cmd>AvanteRefresh<CR>", desc = "Refresh Avante" },
    { "<leader>as", "<cmd>AvanteStop<CR>", desc = "Stop Avante" },
    { "<leader>at", "<cmd>AvanteToggle<CR>", desc = "Toggle Avante" },
    -- FRENO DE MANO: Por si acaso vuelve a pasar
    {
      "<leader>ak",
      function()
        vim.fn.system("ollama stop qwen2.5-coder")
      end,
      desc = "Kill Ollama",
    },
  },
}
