(ensure-package-installed 'web-mode)

(require 'web-mode)
(require 'sgml-mode)

(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.xml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.s?css\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.js\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.gohtml\\.gotmpl\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.php\\'" . web-mode))

(setq web-mode-enable-auto-closing t)
(setq web-mode-enable-auto-expanding t)
(setq web-mode-enable-css-colorization t)
(setq web-mode-enable-current-column-highlight t)
(setq web-mode-enable-current-element-highlight t)

(setq web-mode-ac-source-alist
      '(("css" . (ac-source-words-in-buffer ac-source-css-property))
	("html" . (ac-source-words-in-buffer ac-source-abbrev))
	("php" . (ac-source-yasnippet
		  ac-source-php-auto-yasnippets
		  ac-source-words-in-buffer
		  ac-source-words-in-same-mode-buffers
		  ac-source-dictionary))
	))

(add-hook 'web-mode-hook '(lambda ()
			    (setq web-mode-markup-indent-offset 2)
			    (setq web-mode-css-indent-offset 2)))

(provide 'init-web-mode)
