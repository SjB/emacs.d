(ensure-package-installed 'stickyfunc-enhance)

(require 'stickyfunc-enhance)
(add-to-list 'semantic-default-submodes 'global-semantic-stickyfunc-mode)

(provide 'init-semantic-mode)
