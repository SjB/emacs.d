(ensure-package-installed 'web-mode)

(require 'sgml-mode)

(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.xml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.s?css\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.gohtml\\.gotmpl\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.php\\'" . web-mode))

(eval-after-load "web-mode"
  '(progn

     (setq
      web-mode-enable-auto-closing t
      web-mode-enable-auto-expanding t
      web-mode-enable-auto-pairing t
      web-mode-enable-block-face t
      web-mode-enable-comment-keywords t
      web-mode-enable-css-colorization t
      web-mode-enable-current-column-highlight t
      web-mode-enable-current-element-highlight t)

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

     ;(define-key web-mode-map (kbd "M-(") 'web-mode-element-wrap)
     ;(define-key web-mode-map (kbd "M-)") 'web-mode-element-unwrap)
     ;(define-key web-mode-map (kbd "M-k") 'web-mode-element-kill)
     ;(define-key web-mode-map (kbd "C-M-SPC") 'web-mode-mark-and-expand)
     ;(define-key web-mode-map (kbd "C-:") 'web-mode-comment-or-uncomment)

     (evil-leader/set-key-for-mode 'web-mode
       "m t" 'mc/mark-sgml-tag-pair)

     (define-key web-mode-map (kbd "C-c C-t v") 'web-mode-element-vanish)
     (define-key web-mode-map (kbd "C-c C-t k") 'web-mode-element-kill)
     ))

(provide 'init-web-mode)
