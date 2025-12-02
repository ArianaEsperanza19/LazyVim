-- INFO: typst-preview.nvim is a plugin for Neovim that provides a previewer for Typst files.
return {
	"chomosuke/typst-preview.nvim",
	lazy = false, -- or ft = 'typst'
	version = "1.*",
	opts = {}, -- lazy.nvim will implicitly calls `setup {}`
	keys = { { "<leader>st", "<cmd>TypstPreview<cr>", desc = "Typst Preview" } },
}
