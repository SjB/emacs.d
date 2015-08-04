;; gui settings
(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)

(setq inhibit-startup-screen t)

(prefer-coding-system 'utf-8)

(load-theme 'monokai t)

(require 'ido)
(ido-mode t)
(setq ido-enable-flex-matching t)

(require 'evil)
(evil-mode t)

(require 'evil-surround)
(global-evil-surround-mode 1)

(require 'helm-config)

(helm-mode t)
(helm-adaptative-mode t)
(helm-autoresize-mode t)
(helm-push-mark-mode t)
(setq helm-mode-fuzzy-match t)
(setq helm-completion-in-region-fuzzy-match t)

(require 'lusty-explorer)

(require 'powerline-evil)
(powerline-evil-vim-color-theme)

(require 'yasnippet)
(yas-global-mode t)
(setq yas-snippet-dirs "~/.emacs.d/snippets")

(require 'projectile)

(require 'magit)

(delete-selection-mode t) ; make typing override text selection
(global-linum-mode t) ;always show line numbers

(setq make-backup-files nil) ; stop creating those backup~ files
(setq auto-save-default nil) ; stop creating those #autosave# files
(setq dabrev-case-fold-search t)

(show-paren-mode t)
(recentf-mode t) ; recently opened files menu
