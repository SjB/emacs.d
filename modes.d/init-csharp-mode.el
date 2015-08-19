(ensure-package-installed
 'auto-complete
 'csharp-mode
 'omnisharp)


(require 'csharp-mode)
(require 'omnisharp)
(require 'init-flycheck-mode)
(require 'init-helm-mode)

;; Disable documentation if you need to speed up auto-complete on mono drastically
(setq
 omnisharp-auto-complete-want-documentation nil
 omnisharp-company-do-template-completion t
 omnisharp-server-executable-path (expand-file-name "OmniSharp/OmniSharp.exe" user-emacs-directory))

(add-hook 'csharp-mode-hook '(lambda ()
			       (message "SjB csharp-mode-hook")
			       (add-to-list 'company-backends 'company-omnisharp)
			       (setq company-backends (delete 'company-sematic company-backends))
			       (omnisharp-mode t)) t)


(provide 'init-csharp-mode)
