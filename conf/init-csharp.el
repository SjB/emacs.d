; Load csharp mode
(require 'csharp-mode)
(require 'flycheck)

(defun my:csharp-mode-hook ()
  (omnisharp-mode t)
  (flycheck-mode)
  (setq flycheck-idle-change-delay 2)
  )

(add-hook 'csharp-mode-hook 'my:csharp-mode-hook)

;; Disable documentation if you need to speed up auto-complete on mono drastically
(setq omnisharp-auto-complete-want-documentation nil)
(setq omnisharp-server-executable-path (expand-file-name "OmniSharp/OmniSharp.exe" user-emacs-directory))

;; Example evil-mode config
(eval-after-load 'evil
  '(progn
     (evil-define-key 'insert omnisharp-mode-map (kbd "M-.") 'omnisharp-auto-complete)
     (evil-define-key 'normal omnisharp-mode-map (kbd "<f12>") 'omnisharp-go-to-definition)
     (evil-define-key 'normal omnisharp-mode-map (kbd "g u") 'omnisharp-find-usages)
     (evil-define-key 'normal omnisharp-mode-map (kbd "g I") 'omnisharp-find-implementations) ; g i is taken
     (evil-define-key 'normal omnisharp-mode-map (kbd "g o") 'omnisharp-go-to-definition)
     (evil-define-key 'normal omnisharp-mode-map (kbd "g r") 'omnisharp-run-code-action-refactoring)
     (evil-define-key 'normal omnisharp-mode-map (kbd "g f") 'omnisharp-fix-code-issue-at-point)
     (evil-define-key 'normal omnisharp-mode-map (kbd "g F") 'omnisharp-fix-usings)
     (evil-define-key 'normal omnisharp-mode-map (kbd "g R") 'omnisharp-rename)
     (evil-define-key 'normal omnisharp-mode-map (kbd ", i") 'omnisharp-current-type-information)
     (evil-define-key 'normal omnisharp-mode-map (kbd ", I") 'omnisharp-current-type-documentation)
     (evil-define-key 'insert omnisharp-mode-map (kbd ".") 'omnisharp-add-dot-and-auto-complete)
     (evil-define-key 'normal omnisharp-mode-map (kbd ", n t") 'omnisharp-navigate-to-current-file-member)
     (evil-define-key 'normal omnisharp-mode-map (kbd ", n s") 'omnisharp-navigate-to-solution-member)
     (evil-define-key 'normal omnisharp-mode-map (kbd ", n f") 'omnisharp-navigate-to-solution-file-then-file-member)
     (evil-define-key 'normal omnisharp-mode-map (kbd ", n F") 'omnisharp-navigate-to-solution-file)
     (evil-define-key 'normal omnisharp-mode-map (kbd ", n r") 'omnisharp-navigate-to-region)
     (evil-define-key 'normal omnisharp-mode-map (kbd "<f12>") 'omnisharp-show-last-auto-complete-result)
     (evil-define-key 'insert omnisharp-mode-map (kbd "<f12>") 'omnisharp-show-last-auto-complete-result)
     (evil-define-key 'normal omnisharp-mode-map (kbd ",.") 'omnisharp-show-overloads-at-point)
     (evil-define-key 'normal omnisharp-mode-map (kbd ",rl") 'recompile)

     (evil-define-key 'normal omnisharp-mode-map (kbd ",rt")
       (lambda() (interactive) (omnisharp-unit-test "single")))

     (evil-define-key 'normal omnisharp-mode-map
       (kbd ",rf")
       (lambda() (interactive) (omnisharp-unit-test "fixture")))

     (evil-define-key 'normal omnisharp-mode-map
       (kbd ",ra")
       (lambda() (interactive) (omnisharp-unit-test "all")))
     ))

(provide 'init-csharp)
