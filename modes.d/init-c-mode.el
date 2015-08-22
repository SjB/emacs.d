(ensure-package-installed
 'google-c-style
 'company-c-headers
 'cpputils-cmake
 'flycheck-google-cpplint)

(eval-after-load 'cc-mode
  '(progn
     (require 'company-c-headers)
     (require 'google-c-style)

     (require 'init-cmake-mode)
     (require 'init-ggtags-mode)

     (add-hook 'c-mode-common-hook '(lambda ()
				      (ggtags-mode t)
				      (flycheck-mode t)
				      (hs-minor-mode)))

     (defun init-c-mode-hook ()
       (add-to-list 'company-backends 'company-c-headers)
       (setq company-backends (delete 'company-sematic company-backends))
       ;(setq c-syntactic-indentation nil)
       (google-set-c-style)
       (google-make-newline-indent)
       (cppcm-reload-all)
       (semantic-mode t)
       (semantic-stickyfunc-mode t)
       (semantic-idle-summary-mode t))

     (add-hook 'c-mode-hook 'init-c-mode-hook)
     (add-hook 'c++-mode-hook 'init-c-mode-hook)

     (eval-after-load "init-flycheck-mode"
       '(progn
	  (require 'flycheck-google-cpplint)
	  (custom-set-variables
	   '(flycheck-c/c++-cppcheck-executable (expand-file-name "bin/cpplint.py" user-emacs-directory))
	   '(flycheck-googlelint-verbose "3"))))
))

(provide 'init-c-mode)
