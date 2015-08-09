;; helm settings
(require 'helm-config)
(require 'helm-c-yasnippet)
(require 'helm-projectile)
(require 'helm-gtags)

(helm-mode t)
(helm-adaptative-mode t)
(helm-autoresize-mode t)
(helm-push-mark-mode t)
(setq helm-mode-fuzzy-match t)
(setq helm-yas-space-match-any-greedy t)
(setq helm-completion-in-region-fuzzy-match t)

(eval-after-load 'go-mode
  '(substitute-key-definition 'go-import-add 'helm-go-package go-mode-map))

(eval-after-load 'company
  '(progn
     (define-key company-mode-map (kbd "C-:") 'helm-company)
     (define-key company-active-map (kbd "C-:") 'helm-company)))

(custom-set-variables
 '(helm-gtags-path-style 'relative)
 '(helm-gtags-ignore-case t)
 '(helm-gtags-auto-update t))

(provide 'init-helm)
