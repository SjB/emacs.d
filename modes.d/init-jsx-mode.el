(ensure-package-installed 'jsx-mode)

(add-to-list 'auto-mode-alist '("\\.jsx\\'" . jsx-mode))

(add-hook 'jsx-mode '(lambda ()
		       (js2-minor-mode t)))

(eval-after-load "jsx-mode"
  '(progn
     (setq
      jsx-use-auto-complete t
      jsx-syntax-check-mode "compile"
      jsx-use-flycheck nil)

     (define-key jsx-mode-map (kbd "RET") 'newline-and-indent)
     (define-key jsx-mode-map (kbd "C-c TAB") 'jsx-auto-complete)
  ))

(provide 'init-jsx-mode)
