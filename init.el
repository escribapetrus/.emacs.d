(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(setq custom-file (expand-file-name "lisp/custom.el" user-emacs-directory))
(load custom-file 'noerror)

(require 'init-benchmarking) ;; measure startup time
(require 'init-aesthetics)
(require 'init-packages)

(global-set-key (kbd "<escape>") 'keyboard-escape-quit)
(delete-selection-mode 1)
(fset 'yes-or-no-p 'y-or-n-p)
(unbind-key "C-z")
(setq user-full-name "Pedro Schreiber")
