(let ((default-directory "~/.emacs.d/extra"))
      (normal-top-level-add-to-load-path '("."))
      (normal-top-level-add-subdirs-to-load-path))

(load "yasnippet.conf")
(load "ergoemacs.conf")
(load "csharp-mode.conf")
(load "vala-mode.conf")
(load "ecb-window.conf")

(add-hook 'c-mode-common-hook 
		  (lambda () (c-set-style "linux")))

(delete-selection-mode t) ; make typing override text selection
(global-linum-mode t) ;always show line numbers

(setq make-backup-files nil) ; stop creating those backup~ files
(setq auto-save-default nil) ; stop creating those #autosave# files

; swap buffer for ibuffer
(defalias 'list-buffers 'ibuffer)
(defalias 'rof 'recentf-open-files)
(defalias 'hlm 'hl-line-mode)
(defalias 'gf 'grep-find)
(defalias 'fd 'find-dired)

(show-paren-mode t)
(recentf-mode t) ; recently opened files menu

(global-set-key (kbd "C-'") 'other-window)
(global-set-key (kbd "C-?") 'goto-line)
