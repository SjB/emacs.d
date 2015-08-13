(ensure-package-installed 'ggtags)

(require 'ggtags)

(setenv "GTAGSLIBPATH" (expand-file-name ".gtags" user-emacs-directory))

(custom-set-variables
 '(ggtags-executable-directory (expand-file-name "gtags/bin" user-emacs-directory)))

(setq-local eldoc-documentation-function #'ggtags-eldoc-function)

(provide 'init-ggtags-mode)
