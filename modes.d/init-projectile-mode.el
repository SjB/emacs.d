(ensure-package-installed 'projectile)

(require 'projectile)
(setq
 projectile-enable-caching t
 projectile-completion-system 'company
 projectile-switch-project-action 'helm-projectile
 ;projectile-keymap-prefix (kbd "M-u")
 )

(projectile-global-mode t)
(helm-projectile-on)

(provide 'init-projectile-mode)
