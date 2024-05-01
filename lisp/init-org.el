;;; init.el --- Org-mode configurations -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package org
 :bind (("C-c a" . org-agenda))
 :custom
 (org-hide-leading-stars t)
 (org-list-allow-alphabetical t)
 (org-pretty-entities t)
 (org-pretty-entities-include-sub-superscripts nil)
 (org-babel-default-header-args:python '((:results . "output")))
 (org-latex-compiler "xelatex")
  (org-latex-pdf-process '("xelatex %f"))
 ;; (org-babel-python-command "python3")
  ;; (org-src-fontify-natively t)
 ;; (org-src-tab-acts-natively t)
 ;; (org-hide-emphasis-markers t)
 ;; (org-export-with-sub-superscripts nil)
  ;;(setq org-latex-classes nil)

  
 :config
  (add-to-list 'org-latex-classes
             '("simple-resume-cv"
               "\\documentclass{simple-resume-cv}"
               ("\\part{%s}" . "\\part*{%s}")
               ("\\chapter{%s}" . "\\chapter*{%s}")
               ("\\section{%s}" . "\\section*{%s}")
               ("\\subsection{%s}" . "\\subsection*{%s}")
                ("\\subsubsection{%s}" . "\\subsubsection*{%s}")))

  (org-babel-do-load-languages
  'org-babel-load-languages
  '((emacs-lisp . t)
    (org . t)
    (shell . t)
    (js . t)
    (C . t)
    (awk . t)
    (fortran . t)
    (python . t)
    (elixir . t)
    (restclient . t)
     )))




(use-package ox-gfm)
(use-package ox-spectacle)
(use-package ob-elixir)
(use-package ob-restclient)

(provide 'init-org)
