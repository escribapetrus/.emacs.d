;; hide ugly bars
(tool-bar-mode -1)
(scroll-bar-mode -1)
(menu-bar-mode -1)
;; display line numbers
(global-display-line-numbers-mode 1)
(column-number-mode)
;; highlight current line
(global-hl-line-mode -1)

(setq inhibit-startup-message t
      visible-bell nil
      initial-scratch-message "To be born again, \nsang Gibreel Farishta tumbling from the heavens,\nfirst you have to die...")

(load-theme #'rebecca t)

(provide 'init-aesthetics)
