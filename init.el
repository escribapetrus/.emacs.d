(setq inhibit-startup-message t
      visible-bell nil
      initial-scratch-message "'To be born again', sang Gibreel Farishta\ntumbling from the heavens,\n'first you have to die...'")

(tool-bar-mode -1)
(scroll-bar-mode -1)
(menu-bar-mode -1)

(global-display-line-numbers-mode 1)
;; highlight current line
(global-hl-line-mode -1)
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)
(load-theme 'deeper-blue t)
(delete-selection-mode 1)

(fset 'yes-or-no-p 'y-or-n-p)


(require 'package)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
			 ("org" . "https://orgmode.org/elpa/")
			 ("elpa" . "https://elpa.gnu.org/packages/")))

(package-initialize)
(unless package-archive-contents (package-refresh-contents))

;; initialize use-package on non-linux platforms
(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

(use-package ivy
  :diminish
  ;; :bind (("C-s" . swiper)
  ;; 	 :map ivy-minibuffer-map
  ;; 	 ("TAB" . ivy-alt-done)
  ;; 	 ("C-j" . ivy-next-line)
  ;; 	 ("C-k" . ivy-previous-line)
  ;; 	 :map ivy-switch-previous-line
  ;; 	 ("C-d"  . ivy-switch-buffer-kill)
  ;; 	 :map ivy-reverse-i-search-map)
  :config
  (ivy-mode 1))

(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1)
  :custom ((doom-modeline-height 15))
  )
