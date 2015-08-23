(ensure-package-installed
 'auto-complete
 'csharp-mode
 'omnisharp)

(add-hook 'csharp-mode-hook 'omnisharp-mode)

(eval-after-load "csharp-mode"
  '(progn
     (require 'omnisharp)

     (setq
      ;; Disable documentation if you need to speed up auto-complete on mono drastically
      omnisharp-auto-complete-want-documentation nil
      omnisharp-company-do-template-completion t
      omnisharp-server-executable-path (expand-file-name "OmniSharp/OmniSharp.exe" user-emacs-directory))

     (eval-after-load 'company
       '(progn
	  (add-to-list 'company-backends 'company-omnisharp)
	  (setq company-backends (delete 'company-sematic company-backends))
	  ))

     ;; Example evil-mode config
     (evil-define-key 'insert omnisharp-mode-map (kbd "M-.") 'omnisharp-auto-complete)
     (evil-define-key 'normal omnisharp-mode-map
       (kbd "<f12>") 'omnisharp-go-to-definition
       (kbd "g u") 'omnisharp-helm-find-usages
       (kbd "g I") 'omnisharp-find-implementations
       (kbd "g d") 'omnisharp-go-to-definition
       (kbd "g o") 'omnisharp-helm-find-symbols
       (kbd "g r") 'omnisharp-run-code-action-refactoring
       (kbd ".") 'omnisharp-add-dot-and-auto-complete
       (kbd "<f12>") 'omnisharp-show-last-auto-complete-result
       )

     (evil-leader/set-key-for-mode 'csharp-mode
       "f p" 'omnisharp-fix-code-issue-at-point
       "f u" 'omnisharp-fix-usings
       "R" 'omnisharp-rename
       "i" 'omnisharp-current-type-information
       "I" 'omnisharp-current-type-documentation
       "n t" 'omnisharp-navigate-to-current-file-member
       "n s" 'omnisharp-navigate-to-solution-member
       "n f" 'omnisharp-navigate-to-solution-file-then-file-member
       "n F" 'omnisharp-navigate-to-solution-file
       "n r" 'omnisharp-navigate-to-region
       "." 'omnisharp-show-overloads-at-point
       "r t" 'omnisharp-unit-test-single
       "r f" 'omnisharp-unit-test-fixture
       "r a" 'omnisharp-unit-test-all
       )
     ))

(provide 'init-csharp-mode)
