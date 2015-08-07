(require 'go-mode-autoloads)
(require 'company-go)
(require 'flycheck)
(require 'projectile)

(add-hook 'go-mode-hook (lambda ()
			  ; use company for auto-complete
			  (set (make-local-variable 'company-backends) '(company-go))
			  (company-mode)
			  (flycheck-mode)
			  ; Use goimports instead of go-fmt
			  (setq gofmt-command "goimports")
			  ; Call Gofmt before saving
			  (add-hook 'before-save-hook 'gofmt-before-save)
			  ; Customize compile command to run go build
			  (if (not (string-match 'compile-command))
			      (set (make-local-variable 'compile-command)
				   "go generate && go build -v && go test -v && go vet"))
			  ; Godef jump key bindi
			  ; (local-set-key (kbd "M-.") 'godef-jump)
			  ))

(defun generic-go-env-setting (gopath)
  (exec-path-from-shell-copy-env "PATH")
  (setenv "GOPATH" gopath)
  (setenv "GOBIN" (concat gopath "bin"))
  (message (concat "Project: " (getenv "GOPATH") " OS: " (getenv "GOOS") " ARCH: " (getenv "GOARCH")))
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

(provide 'init-go)
