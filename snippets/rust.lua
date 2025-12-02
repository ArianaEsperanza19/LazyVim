local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

ls.add_snippets("rust", {
	s("main", {
		t({ "fn main() {", "    " }),
		i(0),
		t({ "", "}" }),
	}),
	s("header", {
		t({ "// Nombre: " }),
		i(1),
		t({ ".rs" }),
		t({ "", "" }),
		t({ "// Autor: Ariana Uribe", "" }),
		t({ "// Descripción: ", "" }),
		i(2),
	}),
})
