-- INFO: LuaSnip is a highly flexible and extensible snippet plugin for Neovim, written in Lua. It allows users to define and use code snippets efficiently, helping to speed up the coding process by providing reusable templates that can be quickly expanded. LuaSnip supports various programming languages and integrates seamlessly with other plugins, enhancing overall productivity.
return{
		"L3MON4D3/LuaSnip",
		"hrsh7th/nvim-cmp",
		-- "saadparwaiz1/cmp_luasnip",
		-- "hrsh7th/cmp-nvim-lsp",
		-- "hrsh7th/cmp-buffer",
		-- "hrsh7th/cmp-path",

		dependencies = {
			"rafamadriz/friendly-snippets",
			config = function()
			require("luasnip.loaders.from_vscode").lazy_load()
			require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/luasnippets" })
			end,
		},
}

