(ensure-package-installed 'guide-key)

(require 'guide-key)
(setq guide-key/guide-key-sequence t)
(setq guide-key/idle-delay 0.7)
(guide-key-mode t)

(provide 'init-guide-key-mode)
