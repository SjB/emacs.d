;;; package --- sjb emacs configuration
(require 'package)

;;; Code:
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))

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
			  'evil-leader
			  'evil-matchit
			  'evil-jumper
			  'evil-easymotion
			  'ido-vertical-mode
			  'flx-ido
			  'auto-complete
			  'company
			  'company-c-headers
			  'company-go
			  'cpputils-cmake
			  'cmake-mode
			  'helm
			  'helm-ls-git
			  'helm-ls-hg
			  'helm-go-package
			  'helm-flycheck
			  'helm-projectile
			  'ctags-update
			  'ace-window
			  'csharp-mode
			  'omnisharp
			  'powerline
			  'powerline-evil
			  'yasnippet
			  'projectile
			  'magit
			  'web-mode
			  'go-mode
			  'golint
			  'go-eldoc
			  'iedit
			  'evil-iedit-state
			  'exec-path-from-shell
			  'flycheck-google-cpplint
			  'google-c-style
			  'engine-mode
			  'typescript-mode
			  'guide-key
			  'elisp-slime-nav
			  'monokai-theme)

;(byte-recompile-directory (expand-file-name "conf" user-emacs-directory) 0)
(add-to-list 'load-path (expand-file-name "conf" user-emacs-directory))
(load (expand-file-name "local.el" user-emacs-directory))

(mapc '(lambda (x)
	 (load-library (file-name-sans-extension (file-name-nondirectory x)))
	 )
      (directory-files (expand-file-name "conf" user-emacs-directory) t "^[0-9A-Za-z-]*\\.el"))

(load (expand-file-name "keybinding.el" user-emacs-directory))

(provide 'init)
;;; init.el ends here
