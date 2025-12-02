-- INFO: Codeium is an AI-powered autocompletion plugin for Neovim that enhances coding efficiency by providing intelligent and contextual code suggestions. It helps developers write code faster and more accurately by understanding the context and suggesting completions based on common patterns and best practices.
-- Aun no funciona
--return {
--	"Exafunction/codeium.nvim",
--	opts = function()
--	LazyVim.cmp.actions.ai_accept = function()
--	if require("codeium.virtual_text").get_current_completion_item() then
--		LazyVim.create_undo()
--		vim.api.nvim_input(require("codeium.virtual_text").accept())
--		return true
--		end
--		end
--	end
--}

return {
	"Exafunction/codeium.nvim",
}
