(ensure-package-installed
 'helm
 'helm-ls-git
 'helm-ls-hg
 'helm-company
 'helm-go-package
 'helm-flycheck
 'helm-projectile
 'helm-c-yasnippet
 'helm-gist
 'helm-gtags)

(require 'helm-mode)
(require 'helm-config)
(require 'helm-gist)

;; helm settings
(setq
 helm-split-window-in-side-p t
 helm-move-to-line-cycle-in-source t
 helm-ff-search-library-in-sexp t
 helm-scroll-amount 8
 helm-ff-file-name-history-use-recentf t
 helm-mode-fuzzy-match t
 helm-completion-in-region-fuzzy-match t)

(helm-mode t)
(helm-adaptive-mode t)
(helm-autoresize-mode t)
(helm-push-mark-mode t)

(eval-after-load "helm-c-yasnippet"
  '(progn
     (setq helm-yas-space-match-any-greedy t)
     ))

(add-hook 'dired-mode-hook 'helm-gtags-mode)
(add-hook 'eshell-mode-hook 'helm-gtags-mode)
(add-hook 'c-mode-common-hook 'helm-gtags-mode)

(custom-set-variables
 '(helm-gtags-suggested-key-mapping t)
 '(helm-gtags-prefix-key (kbd "C-c h g")))

(eval-after-load "helm-gtags"
  '(progn
     (setq
      helm-gtags-path-style 'relative
      helm-gtags-ignore-case t
      helm-gtags-auto-update t
      helm-gtags-use-input-at-cursor t
      helm-gtags-pulse-at-cursor t)

     ;; helm-gtags-mode-map
     ;(define-key helm-gtags-mode-map (kbd "C-c h g s") 'helm-gtags-select)
     ;define-key helm-gtags-mode-map (kbd "C-c h g f") 'helm-gtags-tags-in-this-function)
     ;(define-key helm-gtags-mode-map (kbd "M-.") 'helm-gtags-dwin)
     ;(define-key helm-gtags-mode-map (kbd "M-,") 'helm-gtags-pop-stack)
     ;(define-key helm-gtags-mode-map (kbd "C-c <") 'helm-gtags-previous-history)
     ;(define-key helm-gtags-mode-map (kbd "C-c >") 'helm-gtags-next-history)


     ;; helm gtags
     ;(define-key evil-normal-state-map (kbd "C-]") 'helm-gtags-dwim)
     ;(define-key evil-normal-state-map (kbd "C-t") 'helm-gtags-pop-stack)
     ;(define-key c-mode-base-map (kbd "C-]") 'helm-gtags-dwim)
     ;(define-key c-mode-base-map (kbd "C-t") 'helm-gtags-pop-stack)

     (define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebind tab to run persistent action
     (define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB works in terminal
     (define-key helm-map (kbd "C-z")  'helm-select-action) ; list actions using C-z

  ))

(eval-after-load 'go-mode
  '(substitute-key-definition 'go-import-add 'helm-go-package go-mode-map))

(add-hook 'prog-mode-hook '(lambda ()
			     (line-number-mode t)
			     (column-number-mode t)
			     ))


(provide 'init-helm-mode)
