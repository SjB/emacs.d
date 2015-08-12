(ensure-package-installed
 'powerline
 'powerline-evil)

(require 'powerline)
(require 'init-evil-mode)

(require 'powerline-evil)
(powerline-evil-center-color-theme)

(provide 'init-powerline-mode)
