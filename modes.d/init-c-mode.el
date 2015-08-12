(require 'cc-mode)
(require 'flycheck)
(require 'flycheck-google-cpplint)
(require 'google-c-style)
(require 'company-c-headers)
(require 'semantic)
(require 'stickyfunc-enhance)

(add-to-list 'semantic-default-submodes 'global-semantic-stickyfunc-mode)

(add-hook 'c-mode-common-hook '(lambda ()
				 (add-to-list 'company-backends 'company-c-headers)
				 (setq company-backends (delete 'company-sematic company-backends))
				 ;(setq c-syntactic-indentation nil)
				 (google-set-c-style)
				 (google-make-newline-indent)
				 (cppcm-reload-all)
				 (semantic-mode 1)
				 (semantic-stickyfunc-mode 1)
				 (semantic-idle-summary-mode 1)
				 (hs-minor-mode)))

(custom-set-variables
 '(flycheck-c/c++-cppcheck-executable (expand-file-name "bin/cpplint.py" user-emacs-directory))
 '(flycheck-googlelint-verbose "3"))

(provide 'init-c)
