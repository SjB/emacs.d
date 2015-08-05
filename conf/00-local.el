;; gui settings
(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)


(prefer-coding-system 'utf-8)

(load-theme 'monokai t)

(delete-selection-mode t) ; make typing override text selection
(global-linum-mode t) ;always show line numbers
(semantic-mode t)
(global-semantic-idle-scheduler-mode t)

(show-paren-mode t)
(recentf-mode t) ; recently opened files menu

(global-auto-revert-mode t)

(setq inhibit-startup-screen t
      make-backup-files nil ; stop creating those backup~ files
      auto-save-default nil ; stop creating those #autosave# files
      dabrev-case-fold-search t
      linum-format "%3d "
      display-time-default-load-average t
      )

(add-hook 'before-save-hook 'delete-trailing-whitespace)

(require 'dired-x)

(provide 'init-local)
