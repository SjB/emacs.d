(ensure-package-installed 'ggtags)

(setenv "GTAGSLIBPATH" (expand-file-name ".gtags" user-emacs-directory))
(setq exec-path (cons (expand-file-name "gtags/bin" user-emacs-directory) exec-path))

(eval-after-load "ggtags"
  '(progn
     (setq ggtags-executable-directory (expand-file-name "gtags/bin" user-emacs-directory))
     (setq-local eldoc-documentation-function #'ggtags-eldoc-function)

     (eval-after-load "evil"
       '(progn
	  ;; force update evil keymaps after ggtags-mode loaded
	  (add-hook 'ggtags-mode-hook #'evil-normalize-keymaps)
	  (evil-make-overriding-map ggtags-mode-map 'normal)

	  (evil-define-key 'normal ggtags-mode-map (kbd "C-]") 'ggtags-find-tag-dwim)))

     (define-key ggtags-mode-map (kbd "C-c n s") 'ggtags-find-other-symbol)
     (define-key ggtags-mode-map (kbd "C-c n h") 'ggtags-view-tag-history)
     (define-key ggtags-mode-map (kbd "C-c n r") 'ggtags-find-reference)
     (define-key ggtags-mode-map (kbd "C-c n f") 'ggtags-find-file)

     (define-key ggtags-mode-map (kbd "C-c h g c") 'ggtags-create-tags)
     (define-key ggtags-mode-map (kbd "C-c h g u") 'ggtags-update-tags)
     ))

(provide 'init-ggtags-mode)
