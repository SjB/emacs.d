(require 'elisp-slime-nav)
(require 'flycheck)

(defun my:elisp-hook ()
  (elisp-slime-nav-mode)
  (flycheck-mode)
  (eldoc-mode)
  )

(add-hook 'emacs-lisp-mode-hook 'my:elisp-hook)

(eval-after-load 'evil
  '(progn
     (evil-define-key 'normal emacs-lisp-mode-map (kbd "K")
       'elisp-slime-nav-describe-elisp-thing-at-point)))

(provide 'init-elisp)
