
(require 'go-mode-autoloads)
(add-hook 'go-mode-hook (lambda ()
			  ; use company for auto-complete
			  (set (make-local-variable 'company-backend) '(company-go))
			  (company-mode)
			  ; Use goimports instead of go-fmt
			  (setq gofmt-command "goimports")
			  ; Call Gofmt before saving
			  (add-hook 'before-save-hook 'gofmt-before-save)
			  ; Customize compile command to run go build
			  (if (not (string-match 'compile-command))
			      (set (make-local-variable 'compile-command)
				   "go generate && go build -v && go test -v && go vet"))
			  ; Godef jump key binding
			  (local-set-key (kbd "M-.") 'godef-jump)
			  ))

(require 'projectile)

(defun go-env-setup (gopath)
  (setenv "GOPATH" gopath)
  (setenv "GOBIN" (concat gopath "bin"))
  (message (concat "Project: " (getenv "GOPATH") " OS: " (getenv "GOOS") " ARCH: " (getenv "GOARCH")))
)

(defun go-env-linux64 ()
  (interactive)
  (setenv "GOOS" "linux")
  (setenv "GOARCH" "amd64")
  (go-env-setup (projectile-project-root))
)

(defun go-env-win64 ()
  (interactive)
  (setenv "GOOS" "windows")
  (setenv "GOARCH" "amd64")
  (go-env-setup (projectile-project-root))
)

(provide 'init-go)
