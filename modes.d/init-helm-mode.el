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

(require 'helm-mode)
(require 'helm-config)
(require 'helm-c-yasnippet)
(require 'helm-projectile)
(require 'helm-gtags)
(require 'helm-company)

;; helm settings
(setq
 helm-split-window-in-side-p t
 helm-move-to-line-cycle-in-source t
 helm-ff-search-library-in-sexp t
 helm-scroll-amount 8
 helm-ff-file-name-history-use-recentf t
 helm-yas-space-match-any-greedy t
 helm-mode-fuzzy-match t
 helm-completion-in-region-fuzzy-match t

 helm-gtags-path-style 'relative
 helm-gtags-ignore-case t
 helm-gtags-auto-update t
 helm-gtags-use-input-at-cursor t
 helm-gtags-pulse-at-cursor t
 helm-gtags-suggested-key-mapping t
 helm-gtags-prefix-key (kbd "C-c g"))

(helm-mode t)
(helm-adaptive-mode t)
(helm-autoresize-mode t)
(helm-push-mark-mode t)
(helm-gtags-mode t)

(eval-after-load 'go-mode
  '(substitute-key-definition 'go-import-add 'helm-go-package go-mode-map))

(add-hook 'prog-mode-hook '(lambda ()
			     (line-number-mode t)
			     (column-number-mode t)
			     ))

(add-hook 'dired-mode-hook 'helm-gtags-mode)
(add-hook 'eshell-mode-hook 'helm-gtags-mode)
(add-hook 'c-mode-hook 'helm-gtags-mode)
(add-hook 'c++-mode-hook 'helm-gtags-mode)
(add-hook 'asm-mode-hook 'helm-gtags-mode)

;; helm-gtags-mode-map
;(define-key helm-gtags-mode-map (kbd "C-c g a") 'helm-gtags-tags-in-this-function)
;(define-key helm-gtags-mode-map (kbd "M-s") 'helm-gtags-select)
;(define-key helm-gtags-mode-map (kbd "M-.") 'helm-gtags-dwin)
;(define-key helm-gtags-mode-map (kbd "M-,") 'helm-gtags-pop-stack)
;(define-key helm-gtags-mode-map (kbd "C-c <") 'helm-gtags-previous-history)
;(define-key helm-gtags-mode-map (kbd "C-c >") 'helm-gtags-next-history)

(provide 'init-helm-mode)
