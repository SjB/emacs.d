;; gui settings
(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)
(visual-line-mode t)


(prefer-coding-system 'utf-8)

(delete-selection-mode t) ; make typing override text selection
(global-linum-mode t) ;always show line numbers
(semantic-mode t)
(global-semantic-idle-scheduler-mode t)

(show-paren-mode t)
(recentf-mode t) ; recently opened files menu

(global-auto-revert-mode t)

(setq inhibit-startup-screen t
      inhibit-splash-screen t
      inhibit-startup-echo-area-message t
      inhibit-startup-message t
      require-final-newline t
      make-backup-files nil ; stop creating those backup~ files
      auto-save-default nil ; stop creating those #autosave# files
      dabrev-case-fold-search t
      linum-format "%4d\u2502 "
      display-time-default-load-average t
      )

(add-hook 'before-save-hook 'delete-trailing-whitespace)

(setenv "GTAGSLIBPATH" (expand-file-name ".gtags" user-emacs-directory))

(provide 'sjb-custom)
