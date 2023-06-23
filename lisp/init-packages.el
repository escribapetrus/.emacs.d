(require 'package)
(setq package-archives
      '(("gnu" . "https://elpa.gnu.org/packages/")
      ("melpa" . "https://melpa.org/packages/")
      ("melpa-stable" . "https://stable.melpa.org/packages/")
      ("nongnu" . "https://stable.melpa.org/packages/")
      ("org" . "https://orgmode.org/elpa/")
      ("elpa" . "https://elpa.gnu.org/packages/")
      ))

(package-initialize)
(unless package-archive-contents (package-refresh-contents))
;; initialize use-package on non-linux platforms
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

;; list packages here
(use-package exec-path-from-shell)
(exec-path-from-shell-initialize)

(use-package vterm
  :config (add-hook 'vterm-mode-hook
		    (lambda () (display-line-numbers-mode -1)))
  :bind ("C-o" . other-window))

(use-package magit :bind ("C-c m s" . magit-status))

(use-package docker
  :bind ("C-c d" . docker))

(use-package docker-tramp
  :ensure t)

(use-package dired
  :ensure nil
  :defer t
  :config
  (setq
   dired-auto-revert-buffer t
   dired-ls-F-marks-symlinks t
   dired-recursive-copies 'always
   dired-dwim-target t))

(use-package flycheck
  :ensure t
  :init (global-flycheck-mode))


(use-package ivy
  :diminish
  :config (ivy-mode 1))

(use-package ivy-rich
  :init (ivy-rich-mode 1))

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

(use-package which-key :config (which-key-mode))

(use-package projectile
  :config
  (setq projectile-completion-system 'ivy)
  (projectile-mode +1))

(use-package lsp-ivy :commands lsp-ivy-workspace-symbol)

(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1)
  :custom ((doom-modeline-height 15)))

(use-package move-text
  :config
  (move-text-default-bindings))

(use-package rainbow-mode :diminish rainbow-mode)

(use-package solaire-mode :init (solaire-global-mode +1))

(use-package rebecca-theme)

(use-package rainbow-delimiters :hook (prog-mode . rainbow-delimiters-mode))

;; languages
(use-package markdown-mode :mode ("\\.md\\'" . gfm-mode))

(use-package erlang :defer t)

(use-package rust-mode)

(use-package typescript-mode)

(use-package elixir-mode)

(use-package rust-mode)

(use-package python-mode
  :ensure t
  :mode ("\\.py\\'" . python-mode)
  :interpreter ("python3" . python-mode))

(use-package haskell-mode
  :ensure t)

(use-package terraform-mode :ensure t)

(use-package flycheck-haskell
  :ensure t
  :hook (haskell-mode . flycheck-haskell-setup))

(add-hook 'haskell-mode-hook 'haskell-doc-mode)
(add-hook 'haskell-mode-hook 'haskell-indentation-mode)
(add-hook 'haskell-mode-hook 'interactive-haskell-mode)
(setq haskell-process-type 'stack-ghci)
(setq haskell-compile-cabal-build-command "stack build")

(use-package go-mode
  :ensure t
  :hook (go-mode . (lambda ()
                     (add-hook 'before-save-hook 'gofmt-before-save)
                     (setq-local tab-width 4))))

(use-package go-eldoc
  :ensure t
  :hook (go-mode . go-eldoc-setup))

(use-package go-projectile
  :ensure t
  :bind (("C-c p p" . go-projectile-switch-project)
          ("C-c p f" . go-projectile-test-package)
          ("C-c p a" . go-projectile-toggle-between-implementation-and-test)))

(use-package go-guru
  :ensure t)

(use-package go-rename
  :ensure t
  :bind (("C-c r" . go-rename)))

(use-package lsp-mode
  :init
  (setq lsp-keymap-prefix "C-c l")
  ;;(add-to-list 'exec-path "~/.elixir_ls")
  ;;(setq lsp-erlang-server-path "~/.erlang_ls/bin")
  :diminish lsp-mode
  :commands (lsp lsp-deferred)
  :ensure t
  :hook
  (elixir-mode . lsp)
  (erlang-mode . lsp)
  (rust-mode . lsp)
  (terraform-mode . lsp)
  :config (lsp-enable-which-key-integration))

(use-package lsp-ui
  :ensure t
  :commands lsp-ui-mode)



(use-package reformatter
  :config
  (reformatter-define +elixir-format
    :program "mix"
    :args '("format" "-"))

  (defun +set-default-directory-to-mix-project-root (original-fun &rest args)
    (if-let* ((mix-project-root (and buffer-file-name
                                     (locate-dominating-file buffer-file-name
                                                             ".formatter.exs"))))
        (let ((default-directory mix-project-root))
          (apply original-fun args))
      (apply original-fun args)))
  (advice-add '+elixir-format-region :around #'+set-default-directory-to-mix-project-root)

  (add-hook 'elixir-mode-hook #'+elixir-format-on-save-mode))

(provide 'init-packages)
