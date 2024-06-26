;;; init.el --- Org-mode configurations -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package org
 :bind (("C-c a" . org-agenda))
 :custom
 (org-list-allow-alphabetical t)
 (org-pretty-entities t)
 (org-pretty-entities-include-sub-superscripts nil)
 (org-babel-default-header-args:python '((:results . "output")))
 (org-hide-emphasis-markers t)
 (org-latex-compiler "xelatex")
 (org-latex-pdf-process '("xelatex %f"))
 (org-hide-emphasis-markers t)
 :config
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
;;; init-org.el ends here
