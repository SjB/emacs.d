;; settings for imported packages
(require 'lusty-explorer)

(require 'powerline-evil)
(powerline-evil-center-color-theme)

(require 'yasnippet)
(yas-global-mode t)
(add-to-list 'yas-snippet-dirs (expand-file-name "snippets" user-emacs-directory))
(add-to-list 'yas-snippet-dirs (expand-file-name "extra/yasnippet-go" user-emacs-directory))


(require 'projectile)
(projectile-global-mode)
(helm-projectile-on)
(setq projectile-enable-caching t)
(setq projectile-completion-system 'helm)
(setq projectile-switch-project-action 'helm-projectile)
;(setq projectile-keymap-prefix (kbd "M-u"))

(require 'magit)

(require 'web-mode)

;;(require 'auto-complete)
;;(require 'auto-complete-config)
;;(ac-config-default)

(require 'iedit)

(require 'company)

(add-hook 'after-init-hook 'global-company-mode)
(setq company-tooltip-limit 20)
(setq company-idle-delay .3)
(setq company-echo-delay 0)
(setq company-begin-comands '(self-insert-command))

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
