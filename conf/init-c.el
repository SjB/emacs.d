(require 'flycheck)
(require 'flycheck-google-cpplint)
(require 'google-c-style)
(require 'company-c-headers)
(require 'cmake-mode)
(require 'stickyfunc-enhance)

(add-to-list 'semantic-default-submodes 'global-semantic-stickyfunc-mode)

(defun my:c-mode-common-hook ()
  (add-to-list 'company-backends 'company-c-headers)
  (setq company-backends (delete 'company-sematic company-backends))
  (google-set-c-style)
  (google-make-newline-indent)
  (cppcm-reload-all)
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
