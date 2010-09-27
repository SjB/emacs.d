(setq ecb-fix-window-size 'width)
(setq ecb-tip-of-the-day nil)

(add-hook 'ecb-activate-hook (lambda () (ecb-hide-ecb-windows)))

(if (window-system)
	(ecb-activate))

(global-set-key (kbd "<f9>") 'ecb-toggle-ecb-windows)
(global-set-key (kbd "S-<f9>") 'ecb-goto-window-sources)
(global-set-key (kbd "C-<f9>") 'ecb-goto-window-directories)
