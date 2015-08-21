(ensure-package-installed
 'yasnippet
 'react-snippets
 'angular-snippets
 'ember-yasnippets
 'go-snippets
 )

(require 'yasnippet)
(require 'react-snippets)
(require 'angular-snippets)
(require 'ember-yasnippets)
(require 'go-snippets)
(require 'init-ggtags-mode)

;(add-to-list 'yas-snippet-dirs (expand-file-name "snippets" user-emacs-directory))
(add-to-list 'yas-snippet-dirs (expand-file-name "extra/yasnippet-go" user-emacs-directory))
(add-hook 'web-mode-hook '(lambda ()
	  		    (yas-activate-extra-mode 'js-mode)
			    (yas-activate-extra-mode 'html-mode)
			    (yas-activate-extra-mode 'php-mode)
			    (yas-activate-extra-mode 'css-mode)))
(yas-global-mode t)

(define-key yas-keymap (kbd "<return>") 'yas-exit-all-snippets)

;; awesome function from magnars
;; Inter-field navigation
(defun yas/goto-end-of-active-field ()
  (interactive)
  (let* ((snippet (car (yas--snippets-at-point)))
        (position (yas--field-end (yas--snippet-active-field snippet))))
    (if (= (point) position)
        (move-end-of-line 1)
      (goto-char position))))

(defun yas/goto-start-of-active-field ()
  (interactive)
  (let* ((snippet (car (yas--snippets-at-point)))
        (position (yas--field-start (yas--snippet-active-field snippet))))
    (if (= (point) position)
        (move-beginning-of-line 1)
      (goto-char position))))

(define-key yas-keymap (kbd "C-e") 'yas/goto-end-of-active-field)
(define-key yas-keymap (kbd "C-a") 'yas/goto-start-of-active-field)

(provide 'init-yas-mode)
