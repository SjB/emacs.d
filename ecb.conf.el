(setq ecb-tip-of-the-day nil)
(add-hook 'ecb-activate-hook (lambda () (ecb-hide-ecb-windows)))
(ecb-activate)
(global-semantic-idle-summary-mode -1)
(global-set-key (kbd "<f9>") 'ecb-toggle-ecb-windows)
(setq semantic-load-turn-useful-things-on nil)


