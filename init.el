;(byte-recompile-directory (expand-file-name "conf" user-emacs-directory) 0)
(require 'cl)
(require 'package)

(defun ensure-package-installed (&rest packages)
  " Assure every package is installed, ask for installation if it's not. Return a list of installed packages or nil for every skipped package."

  (mapcar
   (lambda (package)
     (if (package-installed-p package)
	 nil
       (package-install package)
	 package))
   packages))

(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))


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
			  'helm-company
			  'helm-go-package
			  'helm-flycheck
			  'helm-projectile
			  'helm-c-yasnippet
			  'helm-gtags
			  'ctags-update
			  'ggtags
			  'stickyfunc-enhance
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
			  'php-mode
			  'engine-mode
			  'typescript-mode
			  'guide-key
			  'elisp-slime-nav
			  'monokai-theme
			  'editorconfig)

(load (expand-file-name "local.el" user-emacs-directory))

(defun load-directory (dir)
  (add-to-list 'load-path dir)
  (mapc '(lambda (x) (load-library (file-name-sans-extension (file-name-nondirectory x))))
      (directory-files dir t "^[0-9A-Za-z-]*\\.el")))

(load-directory (expand-file-name "conf" user-emacs-directory))

(load (expand-file-name "keybinding.el" user-emacs-directory))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(flycheck-c/c++-cppcheck-executable (expand-file-name "bin/cpplint.py" user-emacs-directory))
 '(flycheck-googlelint-verbose "3")
 '(ggtags-executable-directory (expand-file-name "gtags/bin" user-emacs-directory))
 '(helm-gtags-auto-update t)
 '(helm-gtags-ignore-case t)
 '(helm-gtags-path-style (quote relative))
 '(safe-local-variable-values
   (quote
    ((eval progn
	   (setq compile-command
		 (concat "make -C "
			 (expand-file-name "src/code.sagacity.ca/medcartmanager"
					   (projectile-project-root)))))))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-preview ((t (:foreground "darkgray" :underline t))))
 '(company-preview-common ((t (:inherit company-preview))))
 '(company-tooltip ((t (:background "lightgray" :foreground "black"))))
 '(company-tooltip-common ((((type x)) (:inherit company-tooltip :weight bold)) (t (:inherit company-tooltip))))
 '(company-tooltip-common-selection ((((type x)) (:inherit company-tooltip-selection :weight bold)) (t (:inherit company-tooltip-selection))))
 '(company-tooltip-selection ((t (:background "steelblue" :foreground "white")))))
