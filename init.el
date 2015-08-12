;(byte-recompile-directory (expand-file-name "modes.d" user-emacs-directory) 0)

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
 'magit
 'ctags-update
 'editorconfig)

(require 'exec-path-from-shell)
(exec-path-from-shell-copy-env "PATH")


(load-directory (expand-file-name "modes.d" user-emacs-directory))
(load-directory (expand-file-name "script.d" user-emacs-directory))
(load-directory (expand-file-name "custom.d" user-emacs-directory))
