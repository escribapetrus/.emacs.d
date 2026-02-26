;;; init-packages.el --- External package configurations -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package dired
  :ensure nil
  :defer t
  :config
  (setq
   dired-auto-revert-buffer t
   dired-ls-F-marks-symlinks t
   dired-recursive-copies 'always
   dired-dwim-target t))

(use-package exec-path-from-shell :init (exec-path-from-shell-initialize))

(use-package vterm
  :config
  (add-hook 'vterm-mode-hook
	    (lambda () (display-line-numbers-mode -1)))
  :bind
  ("C-o" . other-window))

(use-package restclient :defer t)

(use-package helpful)

(use-package flycheck
  :init (global-flycheck-mode))

(use-package eldoc :ensure nil :diminish eldoc-mode)

(use-package autorevert :ensure nil :diminish auto-revert-mode)

;; Completion framework: vertico + consult + orderless + marginalia
(use-package vertico
  :init (vertico-mode)
  :custom (vertico-cycle t))

(use-package orderless
  :custom
  (completion-styles '(orderless basic))
  (completion-category-overrides '((file (styles partial-completion)))))

(use-package marginalia
  :init (marginalia-mode))

(use-package consult
  :bind
  (("C-s" . consult-line)
   ("C-x b" . consult-buffer)
   ("C-x C-b" . consult-buffer)
   ("M-g g" . consult-goto-line)
   ("M-s r" . consult-ripgrep)))

;; In-buffer completion
(use-package corfu
  :custom
  (corfu-auto t)
  (corfu-cycle t)
  :init (global-corfu-mode))

(use-package which-key :config (which-key-mode))

(use-package projectile
  :config
  (setq projectile-completion-system 'default)
  (projectile-mode +1))

(use-package move-text
  :config
  (move-text-default-bindings))

(use-package rainbow-mode :diminish rainbow-mode)

(use-package solaire-mode :init (solaire-global-mode +1))

(use-package rainbow-delimiters :hook (prog-mode . rainbow-delimiters-mode))

(provide 'init-packages)
