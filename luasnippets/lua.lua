local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
return {
	s("trigger", { -- "trigger" es el texto que activará el snippet
		t("Este es un snippet de prueba"), -- Texto del snippet
	}),
}
