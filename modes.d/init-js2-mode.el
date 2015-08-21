(ensure-package-installed
 'js2-mode
 'ac-js2
 'js2-refactor)

(require 'js2-mode)
(require 'js2-refactor)

(add-to-list 'auto-mode-alist '("\\.json\\'" . js-mode))

;(add-to-list 'interpreter-mode-alist '("node" . js2-mode))

(setq js2-highlight-level 3)

(add-hook 'js-mode-hook 'js2-minor-mode)

(add-hook 'js2-mode-hook (lambda ()
			   '(progn
			      (flycheck-mode t)
			      (ac-js2-mode t)
			      (js2-refactor-mode t)
			      )))

;(js2r-add-keybindings-with-prefix "C-c C-j")

(provide 'init-js2-mode)
