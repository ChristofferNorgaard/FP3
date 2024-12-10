;; -*- lexical-binding: t; -*-

(TeX-add-style-hook
 "main"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-class-options
                     '(("article" "")))
   (TeX-add-to-alist 'LaTeX-provided-package-options
                     '(("float" "") ("graphicx" "") ("babel" "") ("siunitx" "") ("pgfplots" "") ("pgfplotstable" "") ("geometry" "") ("amsmath" "")))
   (TeX-run-style-hooks
    "latex2e"
    "article"
    "art10"
    "float"
    "graphicx"
    "babel"
    "siunitx"
    "pgfplots"
    "pgfplotstable"
    "geometry"
    "amsmath")
   (LaTeX-add-labels
    "eq:3"
    "eq:2"
    "eq:1"
    "eq:5"))
 :latex)

