(require 'package)

(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))

(add-to-list 'load-path "~/.emacs.d/conf")

(defun ensure-package-installed (&rest packages)
  " Assure every package is installed, ask for installation if it's not. Return a list of installed packages or nil for every skipped package."

  (mapcar
   (lambda (package)
     (if (package-installed-p package)
	 nil
       (package-install package)
	 package))
   packages))

;; Make sure to have downloaded archive description.
(or (file-exists-p package-user-dir) (package-refresh-contents))

(package-initialize)

(ensure-package-installed 'evil
			  'evil-surround
			  'helm
			  'helm-ls-git
			  'helm-ls-hg
			  'csharp-mode
			  'omnisharp
			  'lusty-explorer
			  'powerline
			  'powerline-evil
			  'yasnippet
			  'projectile
			  'magit
			  'monokai-theme)

(load "local")
(load "csharp.conf")
(load "alias")
(load "keybinding")
(load "extend-selection")


