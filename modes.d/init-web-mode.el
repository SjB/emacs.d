(ensure-package-installed 'web-mode)

(require 'web-mode)

(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.xml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.s?css\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.php\\.tpl\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.js\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.gohtml\\.gotmpl\\'" . web-mode))

(setq web-mode-enable-auto-closing t)
(setq web-mode-enable-auto-expanding t)
(setq web-mode-enable-css-colorization t)
(setq web-mode-enable-current-column-highlight t)
(setq web-mode-enable-current-element-highlight t)

(setq web-mode-ad-source-alist
      '(("css" . (ac-source-css-property))
	("html" . (ac-source-word-in-buffer ac-source-abbrev))
	("php" . (ac-source-yasnippet ac-source-php-auto-yasnippets))
	))

(add-hook 'web-mode-hook '(lambda ()
			    (setq web-mode-markup-indent-offset 2)
			    (setq web-mode-css-indent-offset 2)))

(provide 'init-web-mode)
