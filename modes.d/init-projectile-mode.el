(ensure-package-installed 'projectile)

(require 'projectile)

(setq projectile-enable-caching t)
(setq projectile-completion-system 'company)
(setq projectile-switch-project-action 'helm-projectile)
;(setq projectile-keymap-prefix (kbd "M-u"))

(projectile-global-mode t)
(helm-projectile-on)

(provide 'init-projectile-mode)
