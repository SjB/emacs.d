
(defun my:c-header-init ()
  (require 'company-c-headers)
  (add-to-list 'company-backends 'company-c-headers)
  )

(add-hook 'c++-mode-hook 'my:c-header-init)
(add-hook 'c-mode-hook 'my:c-header-init)

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

(add-hook 'c-mode-common-hook
	  (lambda ()
	    (if (derived-mode-p 'c-mode 'c++-mode)
		(cppcm-reload-all)
	      )
;;	    (add-to-list 'ac-sources 'ac-source-semantic)))
	    ))

(require 'ede)
(global-ede-mode 1)

(require 'cmake-mode)

(provide 'init-c)
