(ensure-package-installed
 'magit
 'git-gutter+
 'git-gutter-fringe+)

(global-git-gutter+-mode t)

(require 'git-gutter-fringe+)
(git-gutter-fr+-minimal)

; remap C-w in magit-mode to evil-window-map
(eval-after-load "magit-mode"
  '(progn
     (define-key magit-mode-map (kbd "C-w") 'evil-window-map)
     (define-key magit-mode-map (kbd "M-S-w") 'magit-copy-buffer-thing-as-kill)
     (define-key magit-mode-map (kbd "M-w") 'magit-copy-as-kill)))


(provide 'init-magit-mode)
