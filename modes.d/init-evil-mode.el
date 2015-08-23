(ensure-package-installed
 'evil
 'evil-surround
 'evil-leader
 'evil-matchit
 'evil-jumper
 'evil-easymotion)

(require 'evil)

(setq
 evil-emacs-state-cursor '("pink" box)
 evil-normal-state-cursor '("green" box)
 evil-visual-state-cursor '("orange" box)
 evil-insert-state-cursor '("white" bar)
 evil-replace-state-cursor '("blue" bar)
 evil-operator-state-cursor '("red" hollow))

(evil-mode t)

(global-evil-surround-mode t)

(global-evil-jumper-mode t)

(global-evil-leader-mode t)
(evil-leader/set-leader ",")

(evilem-default-keybindings "SPC")

(provide 'init-evil-mode)
