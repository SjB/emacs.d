(ensure-package-installed 'ggtags)

(require 'ggtags)

(setenv "GTAGSLIBPATH" (expand-file-name ".gtags" user-emacs-directory))

(custom-set-variables
 '(ggtags-executable-directory (expand-file-name "gtags/bin" user-emacs-directory)))

(setq-local eldoc-documentation-function #'ggtags-eldoc-function)

;(define-key ggtags-mode-map (kbd "C-c g s") 'ggtags-find-other-symbol)
;(define-key ggtags-mode-map (kbd "C-c g h") 'ggtags-view-tag-history)
;(define-key ggtags-mode-map (kbd "C-c g r") 'ggtags-find-reference)
;(define-key ggtags-mode-map (kbd "C-c g f") 'ggtags-find-file)
;(define-key ggtags-mode-map (kbd "C-c g c") 'ggtags-create-tags)
;(define-key ggtags-mode-map (kbd "C-c g u") 'ggtags-update-tags)

(provide 'init-ggtags-mode)
