\documentclass[12pt]{book}

% Paquetes necesarios
\usepackage[utf8]{inputenc} % Codificación UTF-8
\usepackage[T1]{fontenc}    % Codificación de fuente
\usepackage[spanish]{babel} % Idioma español
\usepackage{geometry}       % Ajuste de márgenes
\usepackage{graphicx}       % Inclusión de gráficos
\usepackage{hyperref}       % Enlaces e índices interactivos

% Configuración de márgenes
\geometry{
  a4paper,         % Tamaño de papel A4
  left=30mm,       % Margen izquierdo
  right=20mm,      % Margen derecho
  top=20mm,        % Margen superior
  bottom=20mm      % Margen inferior
}

\title{Título del Libro}
\author{ {{AUTHOR}} }
\date{\today}

\begin{document}

% Página del título
\maketitle

% Dedicatoria (opcional)
\newpage
\thispagestyle{empty}
\vspace*{1cm}
\begin{flushright}
    \textit{A [Nombre de la persona],\\
    por su amor y apoyo incondicional.}
\end{flushright}

% Índice
\tableofcontents
\newpage

% Capítulo 1
\chapter{Introducción}
Este es el primer capítulo de tu libro. Aquí puedes introducir los temas principales que abordarás.


% Subsección de un capítulo
\subsection{Subsección 1}
Este es el contenido de la primera subsección.

% Añadir imágenes
\begin{figure}[h]
    \centering
    \includegraphics[width=0.5\textwidth]{ruta/al/archivo/imagen.jpg}
    \caption{Descripción de la imagen}
    \label{fig:mi_imagen}
\end{figure}

% Bibliografía
\begin{thebibliography}{9}
\bibitem{ejemplo1}
    Autor/a, \textit{Título del Libro}, Editorial, Año.

\bibitem{ejemplo2}
    Autor/a, \textit{Título del Artículo}, Revista, Volumen(Número), Página, Año.
\end{thebibliography}

\end{document}

