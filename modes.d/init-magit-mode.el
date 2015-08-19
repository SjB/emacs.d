(ensure-package-installed
 'magit
 'git-gutter+
 'git-gutter-fringe+)

(require 'magit)
(require 'git-gutter+)
(require 'git-gutter-fringe+)

(global-git-gutter+-mode t)
(git-gutter-fr+-minimal)

(provide 'init-magit-mode)
