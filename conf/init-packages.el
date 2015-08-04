;; settings for imported packages
(require 'lusty-explorer)

(require 'powerline-evil)
(powerline-evil-center-color-theme)

(require 'yasnippet)
(yas-global-mode t)
(setq yas-snippet-dirs (expand-file-name "snippets" user-emacs-directory))

(require 'projectile)

(require 'magit)

(require 'web-mode)

(require 'auto-complete)
(require 'auto-complete-config)
(ac-config-default)

(require 'iedit)

(require 'company)
(add-hook 'after-init-hook 'global-company-mode)
