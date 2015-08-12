(ensure-package-installed 'stickyfunc-enhance)

(require 'semantic)
(require 'stickyfunc-enhance)

(add-to-list 'semantic-default-submodes 'global-semantic-stickyfunc-mode)

(provide 'init-semantic-mode)
