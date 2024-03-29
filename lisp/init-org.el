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
 (org-babel-python-command "python3")
 (org-babel-default-header-args:python '((:results . "output")))
 (org-latex-compiler "xelatex")
 (org-latex-pdf-process '("xelatex %f"))
 ;; (org-src-fontify-natively t)
 ;; (org-src-tab-acts-natively t)
 ;; (org-hide-emphasis-markers t)
 ;; (org-export-with-sub-superscripts nil)
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
    ;; (haskell . t)
    ;; (rust . t)
    ;; (http . t)
    )))

(use-package ox-gfm)
(use-package ox-spectacle)
(use-package ob-elixir)
(use-package ob-restclient)


(provide 'init-org)
