;; helm settings
(require 'helm)
(require 'helm-config)
(require 'helm-mode)
(require 'helm-c-yasnippet)
(require 'helm-projectile)
(require 'helm-gtags)


(setq helm-split-window-in-side-p t)
(setq helm-move-to-line-cycle-in-source t)
(setq helm-ff-search-library-in-sexp t)
(setq helm-scroll-amount 8)
(setq helm-ff-file-name-history-use-recentf t)
(setq helm-yas-space-match-any-greedy t)
(setq helm-mode-fuzzy-match t)
(setq helm-completion-in-region-fuzzy-match t)

(helm-mode t)
(helm-adaptive-mode t)
(helm-autoresize-mode t)
(helm-push-mark-mode t)
(helm-gtags-mode t)

(eval-after-load 'go-mode
  '(substitute-key-definition 'go-import-add 'helm-go-package go-mode-map))

(custom-set-variables
 '(helm-gtags-path-style 'relative)
 '(helm-gtags-ignore-case t)
 '(helm-gtags-auto-update t))

(provide 'init-helm)
