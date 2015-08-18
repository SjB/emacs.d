(visual-line-mode t)

(nighttime)

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
      x-select-enable-clipboard t
      x-select-enable-primary 3
      save-interprogram-paste-before-kill t
      mouse-yank-at-point t
      load-prefer-newer t)


(add-hook 'before-save-hook 'delete-trailing-whitespace)

(defadvice sgml-delete-tag (after reindent activate)
  (indent-region (point-min) (point-max)))

(provide 'sjb-custom)
