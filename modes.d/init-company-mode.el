(ensure-package-installed 'company)

(require 'company)
(require 'company-yasnippet)
(require 'company-elisp)

(add-to-list 'company-backends 'company-elisp)
(add-to-list 'company-backends 'company-yasnippet)

(setq
 company-tooltip-limit 20
 company-idle-delay .3
 company-echo-delay 0
 company-require-match nil
 company-show-numbers t
 company-begin-commands '(self-insert-command))

(custom-set-faces
 '(company-preview
   ((t (:foreground "darkgray" :underline t))))
 '(company-preview-common
   ((t (:inherit company-preview))))
 '(company-tooltip
   ((t (:background "lightgray" :foreground "black"))))
 '(company-tooltip-selection
   ((t (:background "steelblue" :foreground "white"))))
 '(company-tooltip-common
   ((((type x)) (:inherit company-tooltip :weight bold))
    (t (:inherit company-tooltip))))
 '(company-tooltip-common-selection
   ((((type x)) (:inherit company-tooltip-selection :weight bold))
    (t (:inherit company-tooltip-selection)))))

(add-hook 'after-init-hook 'global-company-mode)

(provide 'init-company-mode)
