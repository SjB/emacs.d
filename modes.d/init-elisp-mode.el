(ensure-package-installed 'elisp-slime-nav)

(require 'elisp-slime-nav)
(require 'init-flycheck-mode)

(add-hook 'emacs-lisp-mode-hook '(lambda ()
				   (elisp-slime-nav-mode)
				   (flycheck-mode)
				   (eldoc-mode)))

(eval-after-load 'evil
  '(progn
     (evil-define-key 'normal emacs-lisp-mode-map (kbd "K")
       'elisp-slime-nav-describe-elisp-thing-at-point)))

(provide 'init-elisp-mode)
