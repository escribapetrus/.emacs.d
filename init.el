(setq inhibit-startup-message t
      visible-bell nil
      initial-scratch-message "To be born again, \nsang Gibreel Farishta tumbling from the heavens,\nfirst you have to die...")

(tool-bar-mode -1)
(scroll-bar-mode -1)
(menu-bar-mode -1)

(global-display-line-numbers-mode 1)
(column-number-mode)
;; highlight current line
(global-hl-line-mode -1)
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)
(delete-selection-mode 1)

(fset 'yes-or-no-p 'y-or-n-p)


(require 'package)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
			 ("nongnu" . "https://stable.melpa.org/packages/")
			 ("org" . "https://orgmode.org/elpa/")
			 ("elpa" . "https://elpa.gnu.org/packages/")))

(package-initialize)
(unless package-archive-contents (package-refresh-contents))

;; initialize use-package on non-linux platforms
(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

(use-package vterm
  :config (add-hook 'vterm-mode-hook
		    (lambda () (display-line-numbers-mode -1)))
  :bind ("C-o" . other-window))
  
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
(load-theme #'rebecca t)

(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(ivy-rich rainbow-delimiters solaire-mode rainbow-mode move-text counsel vterm use-package ivy doom-modeline)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
