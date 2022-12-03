(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(require 'init-benchmarking) ;; measure startup time
(require 'init-aesthetics)
(require 'init-packages)

(global-set-key (kbd "<escape>") 'keyboard-escape-quit)
(delete-selection-mode 1)
(fset 'yes-or-no-p 'y-or-n-p)
(unbind-key "C-z")
(setq user-full-name "Pedro Schreiber")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(markdown-mode projectile vterm use-package solaire-mode rebecca-theme rainbow-mode rainbow-delimiters move-text ivy-rich doom-modeline counsel)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
