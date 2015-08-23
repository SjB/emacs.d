(ensure-package-installed 'auto-complete)

(add-to-list 'load-path (expand-file-name "extra/angularjs-mode"  user-emacs-directory))
(autoload 'angular-mode "angular-mode" "Major mode for angular editing.")
(autoload 'angular-html-mode "angular-html-mode"  "Major mode for angular template editing.")

(eval-after-load "yasnippet"
  '(progn
     (add-to-list 'yas-snippet-dirs (expand-file-name "extra/angularjs-mode/snippets" user-emacs-directory))
     (add-hook 'web-mode-hook '(lambda ()
				 (yas-activate-extra-mode 'angular-mode)
				 (yas-activate-extra-mode 'angular-html-mode)
				 ))
     ))

(eval-after-load "auto-complete"
  '(progn
     (add-to-list 'ac-dictionary-directories (expand-file-name "extra/angularjs-mode/ac-dict" user-emacs-directory))
     (add-to-list 'ac-modes 'angular-mode)
     (add-to-list 'ac-modes 'angular-html-mode)
     ))

(provide 'init-angular-mode)
