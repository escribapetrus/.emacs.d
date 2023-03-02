(require 'package)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
			 ("nongnu" . "https://stable.melpa.org/packages/")
			 ("org" . "https://orgmode.org/elpa/")
			 ("elpa" . "https://elpa.gnu.org/packages/")))

(package-initialize)
(unless package-archive-contents (package-refresh-contents))
;; initialize use-package on non-linux platforms
(unless (package-installed-p 'use-package) (package-install 'use-package))
(require 'use-package)
(setq use-package-always-ensure t)

;; list packages here
(use-package exec-path-from-shell)
(exec-path-from-shell-initialize)

(use-package vterm
  :config (add-hook 'vterm-mode-hook
		    (lambda () (display-line-numbers-mode -1)))
  :bind ("C-o" . other-window))

;; (use-package dired
;;   :ensure nil
;;   :defer t
;;   :config
;;   (setq
;;    dired-auto-revert-buffer t
;;    dired-listing-switches "-laFGh1v"
;;    dired-ls-F-marks-symlinks t 
;;    dired-recursive-copies 'always
;;    dired-dwim-target t))

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

(use-package ivy
  :diminish
  :config (ivy-mode 1))

(use-package ivy-rich
  :init (ivy-rich-mode 1))

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

(use-package erlang
  ;; :load-path ("/Users/pschreiber/.asdf/installs/erlang/25.0.4/lib/tools-3.5.3/emacs")
  :defer t)

(use-package rust-mode)

(use-package elixir-mode)

(use-package rust-mode)

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
  :config (lsp-enable-which-key-integration))

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
