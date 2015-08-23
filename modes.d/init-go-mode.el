(ensure-package-installed
 'go-mode
 'golint
 'go-eldoc
 'go-errcheck
 'company-go)

(eval-after-load "go-mode"
  '(progn
     (require 'go-mode-autoloads)
     (require 'compile)
     (require 'go-eldoc)
     (require 'go-oracle)
     (require 'go-errcheck)

     (require 'init-flycheck-mode)
     (require 'init-company-mode)


     (add-hook 'go-mode-hook (lambda ()
			       (env-go)
			       ;use company for auto-complete
			       (add-to-list 'company-backends 'company-go)
			       (setq company-backends (delete 'company-semantic company-backends))

			       (set (make-local-variable 'company-backends) '(company-go))
			       (go-eldoc-setup)
			       ;Use goimports instead of go-fmt
			       (setq gofmt-command "goimports")

			       ;Call Gofmt before saving
			       (add-hook 'before-save-hook 'gofmt-before-save)

			       (company-mode)
			       (flycheck-mode)))

     (eval-after-load "evil"
       '(progn
	  ;; golang mode keybinding
	  (evil-define-key 'normal go-mode-map
	    "gd" 'godef-jump
	    "gr" 'go-remove-unused-imports
	    "ga" 'go-import-add)))

     (define-key go-mode-map (kbd "C-c i") 'go-goto-imports)))

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

(defun env-go ()
  (interactive)
  (generic-go-env-settings (projectile-project-root) "/opt/go")
)

(defun env-go-beta ()
  (interactive)
  (generic-go-env-settings (projectile-project-root) "~/tools/local/go")
)

(provide 'init-go-mode)
