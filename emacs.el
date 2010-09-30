(yas/initialize)
(yas/load-directory "~/.emacs.d/extra/yasnippet/")

(add-to-list 'load-path "~/.emacs.d/extra/conf")
(add-to-list 'load-path "~/.emacs.d/extra/site-lisp")

(if (window-system)
  	(load "ecb.conf"))

;; (let ((default-directory "~/.emacs.d/extra/site-lisp"))
;;       (normal-top-level-add-to-load-path '("."))
;;       (normal-top-level-add-subdirs-to-load-path))

(load "csharp.conf")
(load "vala.conf")
(load "alias")
(load "keybinding")
(load "extend-selection")
(load "bc")

(add-hook 'c-mode-common-hook 
		  (lambda () (c-set-style "linux")))

(delete-selection-mode t) ; make typing override text selection
(global-linum-mode t) ;always show line numbers

(setq make-backup-files nil) ; stop creating those backup~ files
(setq auto-save-default nil) ; stop creating those #autosave# files
(setq dabrev-case-fold-search t)

(show-paren-mode t)
(recentf-mode t) ; recently opened files menu
