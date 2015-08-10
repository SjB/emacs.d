;; settings for imported packages

(require 'iedit)

;; evil settings
(require 'evil)
(evil-mode t)

(require 'evil-surround)
(global-evil-surround-mode t)

(require 'evil-jumper)
(global-evil-jumper-mode t)

(require 'evil-leader)
(global-evil-leader-mode t)
(evil-leader/set-leader ",")

(require 'evil-easymotion)
(evilem-default-keybindings "SPC")

(setq evil-emacs-state-cursor '("pink" box))
(setq evil-normal-state-cursor '("green" box))
(setq evil-visual-state-cursor '("orange" box))
(setq evil-insert-state-cursor '("blue" bar))
(setq evil-replace-state-cursor '("blue" bar))
(setq evil-operator-state-cursor '("red" hollow))

(require 'powerline-evil)
(powerline-evil-center-color-theme)

(require 'ggtags)
(ggtags-mode t)
(custom-set-variables
 '(ggtags-executable-directory (expand-file-name "gtags/bin" user-emacs-directory)))

(setq-local eldoc-documentation-function #'ggtags-eldoc-function)

(require 'projectile)
(projectile-global-mode)
(helm-projectile-on)
(setq projectile-enable-caching t)
(setq projectile-completion-system 'helm)
(setq projectile-switch-project-action 'helm-projectile)
;(setq projectile-keymap-prefix (kbd "M-u"))

;; ido settings
(require 'ido)
(require 'flx-ido)
(require 'ido-vertical-mode)

(ido-mode t)
(ido-vertical-mode)
(ido-everywhere t)
(flx-ido-mode t)

;(setq ido-use-faces nil)
(add-to-list 'ido-ignore-files "\\.DS_Store")
(add-to-list 'ido-ignore-directories "\\.git")
(add-to-list 'ido-ignore-directories "\\.bzr")
(add-to-list 'ido-ignore-directories "\\.hg")
(add-to-list 'ido-ignore-directories "\\.svn")

(setq ido-enable-prefix nil
      ido-enable-flex-matching t
      ido-case-fold t ;; ignore case
      ido-auto-merge-work-directories-length -1 ;; disable auto-merge (it's confusing)
      ido-create-new-buffer 'always ;; create new files easily
      ido-use-filename-at-point nil ;; don't try to be smart about what I want
      ido-everywhere t
      ido-use-faces t ;; I like visual matching (colors)
      )

;; Ido buffer intuitive navigation
;(add-hook 'ido-setup-hook '(lambda ()
;                             (define-key ido-completion-map "\C-h" 'ido-delete-backward-updir)
;                             (define-key ido-completion-map "\C-n" 'ido-next-match)
;                             (define-key ido-completion-map "\C-f" 'ido-next-match)
;                             (define-key ido-completion-map "\C-p" 'ido-prev-match)
;                             (define-key ido-completion-map "\C-b" 'ido-prev-match)
;                             (define-key ido-completion-map " " 'ido-exit-minibuffer)
;                             ))


(require 'helm)
(require 'helm-config)
(require 'helm-mode)
(require 'helm-c-yasnippet)
(require 'helm-projectile)
(require 'helm-gtags)

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
(require 'yasnippet)
(add-to-list 'yas-snippet-dirs (expand-file-name "snippets" user-emacs-directory))
(add-to-list 'yas-snippet-dirs (expand-file-name "extra/yasnippet-go" user-emacs-directory))
(yas-global-mode t)

(require 'company)
(add-hook 'after-init-hook 'global-company-mode)
(setq company-tooltip-limit 20)
(setq company-idle-delay .3)
(setq company-echo-delay 0)
(setq company-begin-commands '(self-insert-command))

(custom-set-faces
 '(company-preview
   ((t (:foreground "darkgray" :underline t))))
 '(company-preview-common
   ((t (:inherit company-preview))))
 '(company-tooltip
   ((t (:background "lightgray" :foreground "black"))))
 '(company-tooltip-selection
   ((t (:background "steelblue" :foreground "white"))))
 '(company-tooltip-common
   ((((type x)) (:inherit company-tooltip :weight bold))
    (t (:inherit company-tooltip))))
 '(company-tooltip-common-selection
   ((((type x)) (:inherit company-tooltip-selection :weight bold))
    (t (:inherit company-tooltip-selection)))))

(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

(require 'exec-path-from-shell)
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

(require 'guide-key)
(setq guide-key/guide-key-sequence t)
(setq guide-key/idle-delay 0.7)
(guide-key-mode t)

(require 'ace-window)
(setq aw-dispatch-always t)

(require 'engine-mode)
(engine-mode)
;(setq engine/browser-function 'eww-browse-url)

(defengine duckduckgoog
  "http://duckduckgoog.com/?q=%s"
  :keybinding "d")
(defengine github
  "https://github.com/search?ref=simplesearch&q=%s"
  :keybinding "g")

(provide 'init-packages)
