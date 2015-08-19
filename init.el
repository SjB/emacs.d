;(byte-recompile-directory (expand-file-name "modes.d" user-emacs-directory) 0)

;; gui settings
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))


(add-to-list 'load-path (expand-file-name "packages.d" user-emacs-directory))

(require 'cl)
(require 'init-script)

(setq package-archives
      '(("melpa" . "http://melpa.org/packages/")
	("melpa-stable" . "http://stable.melpa.org/packages/")
	("gnu" . "http://elpa.gnu.org/packages/")))

(init-package-system)

; load package that don't have configuration
(ensure-package-installed
 'exec-path-from-shell
 'monokai-theme
 'ctags-update
 'editorconfig)

(require 'exec-path-from-shell)
(exec-path-from-shell-initialize)
(exec-path-from-shell-copy-env "SSH_AUTH_SOCK")

(load-directory (expand-file-name "modes.d" user-emacs-directory))
(load-directory (expand-file-name "script.d" user-emacs-directory))
(load-directory (expand-file-name "custom.d" user-emacs-directory))
