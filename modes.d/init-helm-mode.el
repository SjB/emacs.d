(ensure-package-installed
 'helm
 'helm-ls-git
 'helm-ls-hg
 'helm-company
 'helm-go-package
 'helm-flycheck
 'helm-projectile
 'helm-c-yasnippet
 'helm-gtags)

(require 'helm-config)
(require 'helm-c-yasnippet)
(require 'helm-projectile)
(require 'helm-gtags)
(require 'helm-company)

;; helm settings
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

(add-hook 'prog-mode-hook '(lambda ()
			     (line-number-mode t)
			     (column-number-mode t)
			     ))

(provide 'init-helm-mode)
