(org-babel-do-load-languages
 'org-babel-load-languages
 '(
   (shell . t)
   (js . t)
   (C . t)
   (awk . t)
   (emacs-lisp . t)
   (fortran . t)
;;   (haskell . t)
;;   (rust . t)
;;   (http . t)
   (python . t)))
(setq org-babel-python-command "python3")
(setq org-babel-default-header-args:python
      '((:results . "output")))

;; setup org exports
;; (setq org-latex-pdf-process
;; '("pandoc -f latex -t pdf -o %b.pdf %f"))

(setq org-latex-compiler "xelatex")
(setq org-latex-pdf-process '("xelatex %f"))

(provide 'init-org)
