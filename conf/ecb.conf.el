(setq ecb-tip-of-the-day nil)
(add-hook 'ecb-activate-hook (lambda () (ecb-hide-ecb-windows)))
(ecb-activate)
(global-semantic-idle-summary-mode -1)

(global-set-key (kbd "<f9>") 'ecb-toggle-ecb-windows)
(global-set-key (kbd "C-c <f9>") 'ecb-goto-window-sources)
(global-set-key (kbd "C-c <f10>") 'ecb-goto-window-directories)

(setq semantic-load-turn-useful-things-on nil)


