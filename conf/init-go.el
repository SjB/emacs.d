(require 'go-mode-autoloads)
(require 'company-go)
(require 'compile)
(require 'go-eldoc)
(require 'flycheck)
(require 'projectile)

(add-hook 'go-mode-hook (lambda ()
			  ; use company for auto-complete
			  (add-to-list 'company-backends 'company-go)
			  (setq company-backends (delete 'company-sematic company-backends))

			  ; (set (make-local-variable 'company-backends) '(company-go))
			  (company-mode)
			  (flycheck-mode)
			  (go-eldoc-setup)
			  ; Use goimports instead of go-fmt
			  (setq gofmt-command "goimports")
			  ; Call Gofmt before saving
			  (add-hook 'before-save-hook 'gofmt-before-save)
			  ))

(defun generic-go-env-settings (gopath &optional goroot)
  (if goroot
      (progn
	(setenv "PATH" (concat goroot ":" (getenv "PATH")))
	(setq exec-path (delete goroot exec-path))
	(setq exec-path (cons goroot exec-path))
;	(custom-set-variables
;	 '(go-command (expand-file-name "/bin/go" goroot))
;	 '(gofmt-command (expand-filename "/bin/gofmt" goroot)))
	(setenv "GOROOT" goroot)
       ))

  (setenv "GOPATH" gopath)
  (setenv "GOBIN" (concat gopath "bin"))
  (message (concat "GOROOT: " goroot " GOPATH " (getenv "GOPATH") " OS: " (getenv "GOOS") " ARCH: " (getenv "GOARCH")))
)

(defun env-go-linux64 ()
  (interactive)
  (setenv "GOOS" "linux")
  (setenv "GOARCH" "amd64")
  (generic-go-env-settings (projectile-project-root))
)

(defun env-go-win64 ()
  (interactive)
  (setenv "GOOS" "windows")
  (setenv "GOARCH" "amd64")
  (generic-go-env-settings (projectile-project-root))
)

(defun env-go-beta ()
  (interactive)
  (generic-go-env-settings (projectile-project-root) "/opt/go")
)

(defun env-go ()
  (interactive)
  (generic-go-env-settings (projectile-project-root) "~/tools/local/go")
)

(provide 'init-go)
