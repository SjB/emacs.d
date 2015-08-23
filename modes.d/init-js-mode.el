(ensure-package-installed
 'js2-mode
 'json-mode
 'ac-js2
 'js2-refactor)

(add-to-list 'auto-mode-alist '("\\.json\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.js\\'" . web-mode))

(add-hook 'web-mode-hook '(lambda ()
			    (require 'flycheck)
			    (setq-default flycheck-disabled-checkers
					  (append flycheck-disabled-checkers '(javascript-jshint)))

			    (setq-default flycheck-disabled-checkers
					  (append flycheck-disabled-checkers '(json-jsonlist)))

			    (flycheck-add-mode 'javascript-eslint 'web-mode)

			    (js2-minor-mode t)

			    ))

(add-hook 'js2-init-hook '(lambda ()
			    (ac-js2-mode t)
			    (js2-refactor-mode t)
			    ))


(eval-after-load "js2-mode"
  '(progn
     (setq js2-highlight-level 3)

     (require 'js2-refactor)
     (require 'ac-js2)

     (setq ac-js2-evaluate-calls t)
     (js2r-add-keybindings-with-prefix "C-c C-j")

     ))

(provide 'init-js-mode)
