;;; init.el --- External package configurations -*- lexical-binding: t -*-
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
  :ensure t
  :init (global-flycheck-mode))

(use-package eldoc :ensure t :diminish eldoc-mode)

(use-package autorevert :ensure t :diminish auto-revert-mode)

(use-package ivy
  :diminish
  :config (ivy-mode 1))

(use-package ivy-rich
  :init (ivy-rich-mode 1))

(use-package vertico :init (vertico-mode))

(use-package counsel
  :diminish t
  :config (setq ivy-use-virtual-buffers t
	confirm-nonexistent-file-or-buffer t
	ivy-count-format "(%d%d) ")
  (define-key ivy-minibuffer-map (kbd "C-j") #'ivy-immediate-done)
  (define-key ivy-minibuffer-map (kbd "RET") #'ivy-alt-done)
  :init (ivy-mode 1)
  :bind(("C-c C-r" . ivy-resume)
	("C-x C-f" . counsel-find-file)
	("C-s" . swiper)
	("C-x b" . ivy-switch-buffer)
	("C-x C-b" . ivy-switch-buffer)
	("M-x" . counsel-M-x))
  :config (setq ivy-initial-inputs-alist nil))

;; (use-package corfu
  ;; Optional customizations
  ;; :custom
  ;; (corfu-cycle t)                ;; Enable cycling for `corfu-next/previous'
  ;; (corfu-auto t)                 ;; Enable auto completion
  ;; (corfu-separator ?\s)          ;; Orderless field separator
  ;; (corfu-quit-at-boundary nil)   ;; Never quit at completion boundary
  ;; (corfu-quit-no-match nil)      ;; Never quit, even if there is no match
  ;; (corfu-preview-current nil)    ;; Disable current candidate preview
  ;; (corfu-preselect 'prompt)      ;; Preselect the prompt
  ;; (corfu-on-exact-match nil)     ;; Configure handling of exact matches
  ;; (corfu-scroll-margin 5)        ;; Use scroll margin

  ;; Enable Corfu only for certain modes.
  ;; :hook ((prog-mode . corfu-mode)
  ;;        (shell-mode . corfu-mode)
  ;;        (eshell-mode . corfu-mode))

  ;; Recommended: Enable Corfu globally.  This is recommended since Dabbrev can
  ;; be used globally (M-/).  See also the customization variable
  ;; `global-corfu-modes' to exclude certain modes.
;;  :init
 ;; (global-corfu-mode))

(use-package which-key :config (which-key-mode))

(use-package projectile
  :config
  (setq projectile-completion-system 'ivy)
  (projectile-mode +1))

(use-package lsp-ivy :commands lsp-ivy-workspace-symbol)

(use-package move-text
  :config
  (move-text-default-bindings))

(use-package rainbow-mode :diminish rainbow-mode)

(use-package solaire-mode :init (solaire-global-mode +1))

(use-package rainbow-delimiters :hook (prog-mode . rainbow-delimiters-mode))

(provide 'init-packages)
