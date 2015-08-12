(ensure-package-installed 'yasnippet)

(require 'yasnippet)
(require 'init-ggtags-mode)

;(add-to-list 'yas-snippet-dirs (expand-file-name "snippets" user-emacs-directory))
(add-to-list 'yas-snippet-dirs (expand-file-name "extra/yasnippet-go" user-emacs-directory))
(add-hook 'web-mode-hook '(lambda ()
			    (yas-activate-extra-mode 'html-mode)
			    (yas-activate-extra-mode 'php-mode)
			    (yas-activate-extra-mode 'css-mode)))
(yas-global-mode t)

(provide 'init-yas-mode)
