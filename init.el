(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(setq user-full-name "Pedro Schreiber")
(setq custom-file (expand-file-name "lisp/custom.el" user-emacs-directory))
(load custom-file 'noerror)

(require 'init-benchmarking)
(require 'init-packages)
(require 'init-aesthetics)

(global-set-key (kbd "<escape>") 'keyboard-escape-quit)
(global-set-key (kbd "<f5>") 'vterm)
(delete-selection-mode 1)
(fset 'yes-or-no-p 'y-or-n-p)
(unbind-key "C-z")
