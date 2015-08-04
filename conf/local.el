;; gui settings
(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)

(load-theme 'monokai t)

(require 'ido)
(ido-mode t)
(setq ido-enable-flex-matching t)

(require 'evil)
(evil-mode t)

(require 'helm-config)

(helm-mode t)
(helm-adaptative-mode t)
(helm-autoresize-mode t)
(helm-push-mark-mode t)
(setq helm-mode-fuzzy-match t)
(setq helm-completion-in-region-fuzzy-match t)

(require 'lusty-explorer)

(yas/initialize)
(yas/load-directory "~/.emacs.d/extra/yasnippet/")
(require 'powerline-evil)
(powerline-evil-vim-color-theme)


(if (window-system)
  	(load "ecb.conf"))

;; (let ((default-directory "~/.emacs.d/extra/site-lisp"))
;;       (normal-top-level-add-to-load-path '("."))
;;       (normal-top-level-add-subdirs-to-load-path))

(add-hook 'c-mode-common-hook 
		  (lambda () (c-set-style "java")))

(delete-selection-mode t) ; make typing override text selection
(global-linum-mode t) ;always show line numbers

(setq make-backup-files nil) ; stop creating those backup~ files
(setq auto-save-default nil) ; stop creating those #autosave# files
(setq dabrev-case-fold-search t)

(show-paren-mode t)
(recentf-mode t) ; recently opened files menu
