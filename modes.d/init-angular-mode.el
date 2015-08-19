(ensure-package-installed 'auto-complete)

(add-to-list 'load-path (expand-file-name "extra/angularjs-mode"  user-emacs-directory))

(require 'auto-complete)
(require 'angular-mode)
(require 'angular-html-mode)

(eval-after-load 'yasnippet
  '(progn
     (add-to-list 'yas-snippet-dirs
		  (expand-file-name "extra/angularjs-mode/snippets" user-emacs-directory))
     ))

(add-to-list 'ac-dictionary-directories
	     (expand-file-name "extra/angularjs-mode/ac-dict" user-emacs-directory))

(add-to-list 'ac-modes 'angular-mode)
(add-to-list 'ac-modes 'angular-html-mode)

(provide 'init-angular-mode)
