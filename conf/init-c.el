(require 'flycheck)
(require 'flycheck-google-cpplint)
(require 'google-c-style)
(require 'company-c-headers)
(require 'cmake-mode)

(defun my:c-header-init ()
  (add-to-list 'company-backends 'company-c-headers)
  (google-set-c-style)
  (google-make-newline-indent)
  (cppcm-reload-all)
; (add-to-list 'ac-sources 'ac-source-semantic)))
  )

(add-hook 'c++-mode-hook 'my:c-header-init)
(add-hook 'c-mode-hook 'my:c-header-init)

(eval-after-load 'flycheck
  '(progn
     (custom-set-variables
      '(flycheck-c/c++-cppcheck-executable (expand-file-name "bin/cpplint.py" user-emacs-directory))
      '(flycheck-googlelint-verbose "3"))
     ))

(provide 'init-c)
