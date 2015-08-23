(ensure-package-installed
 ;'js2-mode
 'js3-mode
 'ac-js2
 'js2-refactor)

(add-to-list 'auto-mode-alist '("\\.json\\'" . js3-mode))
(add-to-list 'auto-mode-alist '("\\.js\\'" . js3-mode))

(eval-after-load "js3-mode"
  '(progn
     (setq
      js3-auto-indent-p t
      js3-lazy-commas t
      js3-lazy-operators t
      js3-enter-indents-newline t
      js3-indent-on-enter-key t
      js3-lazy-dots t
      js3-expr-indent-offset 2
      js3-paren-indent-offset 2
      js3-square-indent-offset 2
      js3-curly-indent-offset 0)

     (require 'js2-refactor)
     (add-hook 'js3-mode-hook (lambda ()
				(flycheck-mode t)
				(ac-js2-mode t)
				(js2-refactor-mode t))
	       )))

;(eval-after-load 'auto-complete
;  (add-to-list 'ac-modes 'js3-mode))


;(add-to-list 'interpreter-mode-alist '("node" . js2-mode))
;(setq js2-highlight-level 3)
;(js2r-add-keybindings-with-prefix "C-c C-j")

(provide 'init-js-mode)
