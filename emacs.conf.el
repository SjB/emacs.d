(yas/initialize)
(yas/load-directory "~/.emacs.d/packages/yasnippet-0.6.1c/snippets")
(yas/load-directory "~/.emacs.d/extra/yasnippet/")

(let ((default-directory "~/.emacs.d/extra/site-lisp"))
      (normal-top-level-add-to-load-path '("."))
      (normal-top-level-add-subdirs-to-load-path))

; Load csharp mode
(autoload 'csharp-mode "csharp-mode" "Major mode for editing C# code." t)
(setq auto-mode-alist
	  (append '(("\\.cs$" . csharp-mode)) auto-mode-alist))

(defun my-csharp-mode-fn ()
  "function that runs when csharp-mode is initialized for a buffer."
)

(add-hook  'csharp-mode-hook 'my-csharp-mode-fn t)

; load vala-mode
(autoload 'vala-mode "vala-mode" "Major mode for editing Vala code." t)
(add-to-list 'auto-mode-alist '("\\.vala$" . vala-mode))
(add-to-list 'auto-mode-alist '("\\.vapi$" . vala-mode))
(add-to-list 'file-coding-system-alist '("\\.vala$" . utf-8))
(add-to-list 'file-coding-system-alist '("\\.vapi$" . utf-8))

;(add-hook 'vala-mode-hook 'wisent-csharp-default-setup)

(setq ecb-fix-window-size 'width)
(setq ecb-tip-of-the-day nil)

(add-hook 'ecb-activate-hook (lambda () (ecb-hide-ecb-windows)))

(if (window-system)
	(ecb-activate))

(global-set-key (kbd "<f9>") 'ecb-toggle-ecb-windows)

(cua-mode t)
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
(defalias 'dtw 'delete-trailing-whitespace)

(show-paren-mode t)
(recentf-mode t) ; recently opened files menu

(global-set-key (kbd "C-'") 'other-window)
(global-set-key (kbd "C-?") 'goto-line)



