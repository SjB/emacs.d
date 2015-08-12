;(byte-recompile-directory (expand-file-name "conf.d" user-emacs-directory) 0)

(require 'cl)

(load (expand-file-name "init-script.el" user-emacs-directory))

(setq package-archives
      '(("melpa" . "http://melpa.org/packages/")
	("melpa-stable" . "http://stable.melpa.org/packages/")
	("gnu" . "http://elpa.gnu.org/packages/")))

(init-package-system)

(ensure-package-installed
 'evil
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

(load-directory (expand-file-name "extra.d" user-emacs-directory))
(load-directory (expand-file-name "script.d" user-emacs-directory))
(load-directory (expand-file-name "modes.d" user-emacs-directory))
(load-directory (expand-file-name "custom.d" user-emacs-directory))
