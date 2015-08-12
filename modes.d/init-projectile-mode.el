(ensure-package-installed 'projectile)

(require 'projectile)

(helm-projectile-on)
(setq projectile-enable-caching t)
(setq projectile-completion-system 'helm)
(setq projectile-switch-project-action 'helm-projectile)
;(setq projectile-keymap-prefix (kbd "M-u"))

(projectile-global-mode t)

(provide 'init-projectile-mode)
