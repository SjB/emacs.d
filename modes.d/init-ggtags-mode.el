(ensure-package-installed 'ggtags)

(require 'ggtags)
(ggtags-mode t)
(custom-set-variables
 '(ggtags-executable-directory (expand-file-name "gtags/bin" user-emacs-directory)))

(setq-local eldoc-documentation-function #'ggtags-eldoc-function)

(provide 'init-ggtags-mode)
