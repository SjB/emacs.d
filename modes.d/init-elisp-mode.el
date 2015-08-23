(ensure-package-installed 'elisp-slime-nav)

(eval-after-load 'emacs-lisp-mode
  '(progn
     (require 'elisp-slime-nav)
     (add-hook 'emacs-lisp-mode-hook '(lambda ()
					(add-to-list 'company-backends 'company-elisp)
					(elisp-slime-nav-mode)
					(flycheck-mode)
					(eldoc-mode)))

     (eval-after-load 'evil
       '(progn
	  (evil-define-key 'normal emacs-lisp-mode-map (kbd "K")
	    'elisp-slime-nav-describe-elisp-thing-at-point)))

     ))

(provide 'init-elisp-mode)
