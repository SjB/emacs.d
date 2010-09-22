(add-hook 'python-mode-hook (lambda() (linum-mode 1)))
(add-hook 'cc-mode-hook (lambda() linum-mode 1)))

(yas/initialize)
(yas/load-directory "~/.emacs.d/packages/yasnippet-0.6.1c/snippets")
(yas/load-directory "~/.emacs.d/yasnippet/snippets")

(let ((default-directory "~/.emacs.d/site-lisp/"))
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
