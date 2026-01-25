--INFO: Avante is a plugin for Neovim that integrates AI-powered code assistance and chat functionality directly
-- Matar proceso
-- sudo pkill -9 ollama
return {
  "yetone/avante.nvim",
  build = vim.fn.has("win32") ~= 0 and "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false"
    or "make",
  event = "VeryLazy",
  opts = {
    provider = "ollama",
    auto_suggestions_provider = "ollama",
    input = { enabled = true },
    providers = {
      ollama = {
        __inherited_from = "openai",
        endpoint = "http://127.0.0.1:11434/v1",
        model = "llama3.2",
        timeout = 30000,
        temperature = 0.2,
        max_tokens = 4096,
      },
    },
    -- Esto es vital para que no se sature la UI
    behaviour = {
      auto_suggestions = false, -- Desactiva si notas lag al escribir
      auto_set_highlight_group = true,
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
