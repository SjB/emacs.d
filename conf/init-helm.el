;; helm settings
(require 'helm-config)
(require 'helm-projectile)

(helm-mode t)
(helm-adaptative-mode t)
(helm-autoresize-mode t)
(helm-push-mark-mode t)
(setq helm-mode-fuzzy-match t)
(setq helm-completion-in-region-fuzzy-match t)

(eval-after-load 'go-mode
  '(substitute-key-definition 'go-import-add 'helm-go-package go-mode-map))

(provide 'init-helm)
