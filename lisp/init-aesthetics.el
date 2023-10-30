;;; init-aesthetics.el --- Appearance configurations -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package rebecca-theme)

(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1)
  :custom ((doom-modeline-height 15)))

(tool-bar-mode -1)
(scroll-bar-mode -1)
(menu-bar-mode -1)
(column-number-mode)
(global-hl-line-mode -1)
(global-display-line-numbers-mode 1)
(fset 'display-startup-echo-area-message #'ignore)
(set-frame-parameter (selected-frame) 'alpha '(95 95))
(add-to-list 'default-frame-alist '(alpha 95 95))
(add-to-list 'default-frame-alist
             '(font . "FiraCode Nerd Font Mono-14"))
(load-theme #'rebecca t)

(setq inhibit-startup-message t
      visible-bell nil
      initial-scratch-message ";; To be born again, \n;; sang Gibreel Farishta tumbling from the heavens,\n;; first you have to die...")

(provide 'init-aesthetics)
