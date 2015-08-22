(ensure-package-installed
 'tern
 'tern-auto-complete)

(eval-after-load 'js3-mode
  (add-hook 'js3-mode-hook '(lambda() (tern-mode t))))


(eval-after-load 'tern
  '(progn
     (setq tern-command (cons (executable-find "tern") '()))
     (require 'tern-auto-complete)
     (tern-ac-setup)))

(provide 'init-tern-mode)
