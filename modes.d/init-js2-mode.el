(ensure-package-installed
 'tern
 'tern-auto-complete
 'js2-mode
 'ac-js2
 'js2-refactor)

(require 'js2-refactor)
(require 'init-flycheck-mode)

(setq js2-highlight-level 3)

(add-hook 'js-mode-hook (lambda ()
			  '(progn
			     (flycheck-mode t)
			     (js2-minor-mode t))))

(add-hook 'javascript-mode (lambda ()
			     '(progn
				(flycheck-mode t)
				(js2-minor-mode t))))

(add-hook 'web-mode-hook 'js2-minor-mode)
(add-hook 'js2-mode-hook (lambda ()
			   '(progn
			      (ac-js2-mode t)
			      (js2-refactor-mode t)
			      (tern-mode t)
			      )))

(eval-after-load 'tern
  '(progn
     (require 'tern-auto-complete)
     (tern-ac-setup)))

(js2r-add-keybindings-with-prefix "C-c C-m")

(provide 'init-js2-mode)
