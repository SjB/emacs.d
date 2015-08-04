;; gui settings
(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)

(setq inhibit-startup-screen t)

(prefer-coding-system 'utf-8)

(load-theme 'monokai t)

(require 'ido)
(ido-mode t)

(require 'ido-vertical-mode)
(ido-vertical-mode)

(setq ido-enable-flex-matching t)
(setq ido-enable-prefix nil
      ido-enable-flex-matching t
      ido-case-fold t ;; ignore case
      ido-auto-merge-work-directories-length -1 ;; disable auto-merge (it's confusing)
      ido-create-new-buffer 'always ;; create new files easily
      ido-use-filename-at-point nil ;; don't try to be smart about what I want
      ido-everywhere t
      )

;; I like visual matching (colors)
(setq ido-use-faces t)

;; Ido buffer intuitive navigation
(add-hook 'ido-setup-hook '(lambda ()
                             (define-key ido-completion-map "\C-h" 'ido-delete-backward-updir)
                             (define-key ido-completion-map "\C-n" 'ido-next-match)
                             (define-key ido-completion-map "\C-f" 'ido-next-match)
                             (define-key ido-completion-map "\C-p" 'ido-prev-match)
                             (define-key ido-completion-map "\C-b" 'ido-prev-match)
                             (define-key ido-completion-map " " 'ido-exit-minibuffer)
                             ))

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
