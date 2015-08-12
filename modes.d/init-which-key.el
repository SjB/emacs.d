(ensure-package-installed 'which-key)

(require 'which-key)

(setq
 which-key-popup-type 'side-window
 which-key-side-window-location 'right)

(which-key-mode t)

(provide 'init-which-key)
