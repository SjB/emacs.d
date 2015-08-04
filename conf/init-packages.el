;; settings for imported packages
(require 'lusty-explorer)

(require 'powerline-evil)
(powerline-evil-vim-color-theme)

(require 'yasnippet)
(yas-global-mode t)
(setq yas-snippet-dirs (expand-file-name "snippets" user-emacs-directory))

(require 'projectile)

(require 'magit)

(require 'web-mode)

