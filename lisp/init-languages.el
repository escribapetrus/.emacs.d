;;; init-languages.el --- Language configurations -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package flyspell
 :ensure t
 :config
 (setq
  ispell-program-name "aspell"
  ispell-dictionary "en")
 (add-hook 'text-mode-hook #'flyspell-mode) (add-hook 'prog-mode-hook #'flyspell-prog-mode))

(use-package web-mode
 :config
 (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
 (add-to-list 'auto-mode-alist '("\\.eex?\\'" . web-mode)))

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

(use-package haskell-mode :ensure t)

(use-package terraform-mode :ensure t)

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

;; (use-package
;;  eglot
;;  :ensure nil
;;  :config (add-to-list 'eglot-server-programs '(elixir-ts-mode "language_server.sh")))

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

(use-package
 elisp-autofmt
 :commands (elisp-autofmt-mode elisp-autofmt-buffer)
 :hook (emacs-lisp-mode . elisp-autofmt-mode))

(provide 'init-languages)
