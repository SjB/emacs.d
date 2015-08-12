(ensure-package-installed
 'google-c-style
 'company-c-headers
 'cpputils-cmake
 'flycheck-google-cpplint)

(require 'cc-mode)
(require 'company-c-headers)
(require 'google-c-style)

(require 'init-cmake-mode)
(require 'init-flycheck-mode)


(add-hook 'c-mode-common-hook '(lambda ()
				 (add-to-list 'company-backends 'company-c-headers)
				 (setq company-backends (delete 'company-sematic company-backends))
				 ;(setq c-syntactic-indentation nil)
				 (google-set-c-style)
				 (google-make-newline-indent)
				 (cppcm-reload-all)
				 (semantic-mode t)
				 (flycheck t)
				 (semantic-stickyfunc-mode t)
				 (semantic-idle-summary-mode t)
				 (hs-minor-mode)))

(eval-after-load 'init-flycheck-mode
  '(progn
     (require 'flycheck-google-cpplint)
     (custom-set-variables
      '(flycheck-c/c++-cppcheck-executable (expand-file-name "bin/cpplint.py" user-emacs-directory))
      '(flycheck-googlelint-verbose "3"))))


(provide 'init-c-mode)
