;; settings for imported packages
(require 'dired-x)

(require 'powerline-evil)
(powerline-evil-center-color-theme)

(require 'yasnippet)
(add-to-list 'yas-snippet-dirs (expand-file-name "snippets" user-emacs-directory))
(add-to-list 'yas-snippet-dirs (expand-file-name "extra/yasnippet-go" user-emacs-directory))
(yas-global-mode t)

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

(require 'magit)

(require 'iedit)

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
