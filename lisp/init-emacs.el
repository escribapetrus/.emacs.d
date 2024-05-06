;;; init-emacs.el --- Emacs configurations -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package emacs
  :ensure nil
  :hook (after-init . (lambda () (setq gc-cons-threshold (* 2 1000 1000))))
  :custom
  (user-full-name "Pedro Schreiber")
  (custom-file (expand-file-name "lisp/.custom.el" user-emacs-directory))
  (load custom-file 'noerror)
  (bidi-paragraph-direction 'left-to-right)
  (use-short-answers t)
  (load-prefer-newer t)
  (bidi-paragraph-direction 'left-to-right)
  (inhibit-startup-screen t)
  (indent-tabs-mode nil)
  (lisp-indent-function nil)
  (lisp-indent-offset 2)
  (treesit-language-source-alist
    '((bash "https://github.com/tree-sitter/tree-sitter-bash")
       (cmake "https://github.com/uyha/tree-sitter-cmake")
       (css "https://github.com/tree-sitter/tree-sitter-css")
       (elisp "https://github.com/Wilfred/tree-sitter-elisp")
       (heex "https://github.com/phoenixframework/tree-sitter-heex")
       (elixir "https://github.com/elixir-lang/tree-sitter-elixir")
       (go "https://github.com/tree-sitter/tree-sitter-go")
       (html "https://github.com/tree-sitter/tree-sitter-html")
       (javascript "https://github.com/tree-sitter/tree-sitter-javascript" "master" "src")
       (json "https://github.com/tree-sitter/tree-sitter-json")
       (make "https://github.com/alemuller/tree-sitter-make")
       (markdown "https://github.com/ikatyang/tree-sitter-markdown")
       (python "https://github.com/tree-sitter/tree-sitter-python")
       (toml "https://github.com/tree-sitter/tree-sitter-toml")
       (tsx "https://github.com/tree-sitter/tree-sitter-typescript" "master" "tsx/src")
       (typescript "https://github.com/tree-sitter/tree-sitter-typescript" "master" "typescript/src")
       (yaml "https://github.com/ikatyang/tree-sitter-yaml")))
  :init
  (load custom-file 'noerror)
  (unbind-key "C-z")
 :config
  (delete-selection-mode 1)
  (global-prettify-symbols-mode)
  :bind
  (("C-+" . text-scale-increase)
   ("C--" . text-scale-decrease)
   ("C-c C-c" . projectile-compile-project)
   ("C-c C-t" . projectile-test-project)
   ("C-c C-r" . projectile-run-project)
   ("C-o" . other-window)
   ("<f5>" . projectile-run-vterm)
   ("<f6>" . toggle-frame-fullscreen)
   ("<escape>" . keyboard-escape-quit)
   ("C-q" . kill-buffer)))

(provide 'init-emacs)
;;; init-emacs.el ends here
