;;; init.el --- Core Emacs configurations -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:
(require 'package)
(require 'use-package-ensure)

(setq package-archives
  '(("melpa-stable" . "https://stable.melpa.org/packages/")
     ("org" . "https://orgmode.org/elpa/")
     ("elpa" . "https://elpa.gnu.org/packages/")
     ("melpa" . "https://melpa.org/packages/")
      ))

;; initialize use-package on non-linux platforms
(package-initialize)
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(setq use-package-always-ensure t)
(unless package-archive-contents (package-refresh-contents))
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(require 'init-emacs)
(require 'init-benchmarking)
(require 'init-packages)
(require 'init-aesthetics)
(require 'init-org)
(require 'init-languages)



