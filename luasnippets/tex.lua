local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

ls.add_snippets("tex", {
	-- Snippet para negrita
	s("/n", { t("\\textbf{"), i(1, "texto"), t("}") }),

	-- Snippet para cursiva
	s("/k", { t("\\textit{"), i(1, "texto"), t("}") }),

	-- Snippet para nota de pie de página
	s("/fp", { t("\\footnote{"), i(1, "nota"), t("}") }),

	-- Snippet para cita
	s("/c", { t("\\cite{"), i(1, "referencia"), t("}") }),

	-- Snippet para Encabecado, titulo, autor y fecha
	s("/tt", {
		(t({ "", "\\tittle{" })),
		i(1, "titulo"),
		t("}"),
		(t({ "", "\\author{" })),
		i(2, "autor"),
		t("}"),
		(t({ "", "\\date{" })),
		i(3, "fecha"),
		t("}"),
	}),

	-- Snippet para sección
	s("/sec", {
		t("\\section{"),
		i(1, "Título de la Sección"),
		t("}"),
	}),

	-- Snippet para subsección
	s("/subsec", {
		t("\\subsection{"),
		i(1, "Título de la Subsección"),
		t("}"),
	}),

	-- Snippet para lista enumerada
	s("/enum", {
		t("\\begin{enumerate}"),
		t({ "", "  \\item " }),
		i(1, "Primer ítem"),
		t({ "", "  \\item " }),
		i(2, "Segundo ítem"),
		t({ "", "  \\item " }),
		i(3, "Tercer ítem"),
		t({ "", "\\end{enumerate}" }),
	}),

	-- Snippet para lista no numerada
	s("/item", {
		t("\\begin{itemize}"),
		t({ "", "  \\item " }),
		i(1, "Primer ítem"),
		t({ "", "  \\item " }),
		i(2, "Segundo ítem"),
		t({ "", "  \\item " }),
		i(3, "Tercer ítem"),
		t({ "", "\\end{itemize}" }),
	}),

	-- Snippet para tabla
	s("/table", {
		t("\\begin{table}[h]"),
		t({ "", "  \\centering" }),
		t({ "", "  \\begin{tabular}{|c|c|c|}" }),
		t({ "", "    \\hline" }),
		t({ "", "    " }),
		i(1, "Encabezado 1"),
		t(" & "),
		i(2, "Encabezado 2"),
		t(" & "),
		i(3, "Encabezado 3"),
		t(" \\\\ \\hline"),
		t({ "", "    " }),
		i(4, "Dato 1"),
		t(" & "),
		i(5, "Dato 2"),
		t(" & "),
		i(6, "Dato 3"),
		t(" \\\\ \\hline"),
		t({ "", "  \\end{tabular}" }),
		t({ "", "  \\caption{" }),
		i(7, "Título de la Tabla"),
		t("}"),
		t({ "", "  \\label{tab: " }),
		i(8, "etiqueta"),
		t("}"),
		t({ "", "\\end{table}" }),
	}),
	-- Snippet para figura
	s("/fig", {
		t("\\begin{figure}[h]"),
		t({ "", "  \\centering" }),
		t({ "", "  \\includegraphics[width=\\textwidth]{" }),
		i(1, "ruta/de/la/imagen"),
		t("}"),
		t({ "", "  \\caption{" }),
		i(2, "Título de la Figura"),
		t("}"),
		t({ "", "  \\label{fig: " }),
		i(3, "etiqueta"),
		t("}"),
		t({ "", "\\end{figure}" }),
	}),
})
