;; evil settings
(require 'evil)
(evil-mode t)

(require 'evil-surround)
(global-evil-surround-mode t)

(require 'evil-jumper)
(global-evil-jumper-mode t)

(require 'evil-leader)
(global-evil-leader-mode t)
(evil-leader/set-leader ",")

(require 'evil-matchit)

(require 'evil-easymotion)
(evilem-default-keybindings "SPC")

(provide 'init-evil)
