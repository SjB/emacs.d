(require 'elisp-slime-nav)

(defun my:elisp-hook ()
  (elisp-slime-nav-mode)
  (turn-on-eldoc-mode)
  )

(add-hook 'emacs-lisp-mode-hook 'my:elisp-hook)

(eval-after-load 'evil
  '(progn
     (evil-define-key 'normal emacs-lisp-mode-map (kbd "K")
       'elisp-slime-nav-describe-elisp-thing-at-point)))

(provide 'init-elisp)
