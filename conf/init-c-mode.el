
(defun my:ac-c-header-init ()
  (require 'auto-complete-c-headers)
  (add-to-list 'ac-sources 'ac-source-c-headers)
  )

(add-hook 'c++-mode-hook 'my:ac-c-header-init)
(add-hook 'c-mode-hook 'my:ac-c-header-init)

(eval-after-load 'flycheck
  '(progn
     (require 'flycheck-google-cpplint)
     (custom-set-variables
      '(flycheck-c/c++-cppcheck-executable (expand-file-name "bin/cpplint.py" user-emacs-directory))
      '(flycheck-googlelint-verbose "3"))
     ))

(require 'google-c-style)
(add-hook 'c-mode-common-hook 'google-set-c-style)
(add-hook 'c-mode-common-hook 'google-make-newline-indent)

(add-hook 'c-mode-common-hook '(lambda () (add-to-list 'ac-sources 'ac-source-semantic)))

(global-ede-mode 1)
