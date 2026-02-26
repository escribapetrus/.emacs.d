;;; init-languages.el --- Language configurations -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package
 flyspell
 :ensure t
 :config
 (setq
  ispell-program-name "aspell"
  ispell-dictionary "en")
 (add-hook 'text-mode-hook #'flyspell-mode)
 (add-hook 'prog-mode-hook #'flyspell-prog-mode))

(use-package
 web-mode
 :config
 (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
 (add-to-list 'auto-mode-alist '("\\.eex?\\'" . web-mode))
 (add-to-list 'auto-mode-alist '("\\.heex?\\'" . web-mode)))

(use-package markdown-mode :mode ("\\.md\\'" . gfm-mode))

(use-package erlang :defer t)

(use-package rust-mode :hook (rust-mode . eglot-ensure))

(use-package typescript-mode :hook (typescript-mode . eglot-ensure))

(use-package
 elixir-mode
 :config
 (projectile-register-project-type
  'elixir
  '("mix.exs")
  :project-file "mix.exs"
  :compile "mix compile"
  :test "mix test"
  :run "iex -S mix")
 :hook (before-save . elixir-format) (elixir-mode . eglot-ensure))

(use-package
 python
 :ensure nil
 :hook (python-mode . eglot-ensure))

(use-package haskell-mode)

(use-package terraform-mode)

(use-package
 go-mode
 :hook (go-mode . eglot-ensure)
 :config
 (projectile-register-project-type
  'go
  '("go.mod")
  :project-file "go.mod"
  :compile "go build"
  :test "go test"
  :run "go run")
 (add-hook 'before-save-hook #'gofmt-before-save))

(use-package go-eldoc :hook (go-mode . go-eldoc-setup))

(use-package
 eglot
 :ensure nil
 :config
 (add-to-list
  'eglot-server-programs
  '(elixir-mode "expert" "--stdio"))
 (add-to-list
  'eglot-server-programs
  '(go-mode "gopls")))

(use-package
 elisp-autofmt
 :bind (("C-c f" . elisp-autofmt-buffer)))

(provide 'init-languages)
