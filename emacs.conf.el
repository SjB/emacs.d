(add-hook 'python-mode-hook (lambda() (linum-mode 1)))
(add-hook 'cc-mode-hook (lambda() (linum-mode 1)))

(yas/initialize)
(yas/load-directory "~/.emacs.d/packages/yasnippet-0.6.1c/snippets")
(yas/load-directory "~/.emacs.d/extra/yasnippet/")

(let ((default-directory "~/.emacs.d/extra/site-lisp/"))
      (normal-top-level-add-to-load-path '("."))
      (normal-top-level-add-subdirs-to-load-path))

(autoload 'csharp-mode "csharp-mode" "Major mode for editing C# code." t)

(setq auto-mode-alist
	  (append '(("\\.cs$" . csharp-mode)) auto-mode-alist))

(defun my-csharp-mode-fn ()
  "function that runs when csharp-mode is initialized for a buffer."
  ...insert your code here...
  ...most commonly, your custom key bindings ...
  )

(add-hook  'csharp-mode-hook 'my-csharp-mode-fn t)

(add-hook 'c-mode-common-hook 
		  (lambda () (c-set-style "linux")))

(autoload 'vala-mode "vala-mode" "Major mode for editing Vala code." t)
(add-to-list 'auto-mode-alist '("\\.vala$" . vala-mode))
(add-to-list 'auto-mode-alist '("\\.vapi$" . vala-mode))
(add-to-list 'file-coding-system-alist '("\\.vala$" . utf-8))
(add-to-list 'file-coding-system-alist '("\\.vapi$" . utf-8))

(add-hook 'vala-mode-hook #'wisent-csharp-default-setup)

(setq ecb-fix-window-size 'width)
(setq ecb-tip-of-the-day nil)

(add-hook 'ecb-activate-hook (lambda () (ecb-hide-ecb-windows)))

(if (window-system)
	(ecb-activate))

