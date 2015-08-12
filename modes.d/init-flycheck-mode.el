(ensure-package-installed 'flycheck)

(require 'flycheck)
(add-hook 'after-init-hook #'global-flycheck-mode)

(provide 'init-flycheck-mode)
