(ensure-package-installed
 'evil
 'evil-surround
 'evil-leader
 'evil-matchit
 'evil-jumper
 'evil-easymotion)

(require 'evil)
(require 'evil-surround)
(require 'evil-jumper)
(require 'evil-leader)
(require 'evil-easymotion)

(evil-mode t)

(global-evil-surround-mode t)

(global-evil-jumper-mode t)

(global-evil-leader-mode t)
(evil-leader/set-leader ",")

(evilem-default-keybindings "SPC")

(setq evil-emacs-state-cursor '("pink" box))
(setq evil-normal-state-cursor '("green" box))
(setq evil-visual-state-cursor '("orange" box))
(setq evil-insert-state-cursor '("white" bar))
(setq evil-replace-state-cursor '("blue" bar))
(setq evil-operator-state-cursor '("red" hollow))

(provide 'init-evil-mode)
