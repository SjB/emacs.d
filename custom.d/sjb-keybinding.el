;; SjB Alias
(defalias 'b 'helm-mini)
(defalias 'rof 'recentf-open-files)
(defalias 'hlm 'hl-line-mode)
(defalias 'gf 'grep-find)
(defalias 'fd 'find-dired)
(defalias 'dtw 'delete-trailing-whitespace)


;; SjB keybinding file
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-x b") 'helm-mini)
(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "C-x M-g") 'magit-dispatch-popup)

(global-set-key (kbd "C-c a") 'ace-window)
(global-set-key (kbd "C-c SPC") 'ace-jump-mode)

; expand region
(global-set-key (kbd "C-=") 'er/expand-region)

; start helm from company-mode
(define-key company-mode-map (kbd "C-;") 'helm-company)
(define-key company-active-map (kbd "C-;") 'helm-company)

; helm keybinding
(global-set-key (kbd "C-c y") 'helm-yas-complete)
(global-set-key (kbd "C-c h") 'helm-command-prefix)
(global-unset-key (kbd "C-x c"))

(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebind tab to run persistent action
(define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB works in terminal
(define-key helm-map (kbd "C-z")  'helm-select-action) ; list actions using C-z

(define-key evil-window-map "a" 'ace-window)

(evil-leader/set-key "w" 'save-buffer)
(evil-leader/set-key "q" 'kill-buffer-and-window)
(evil-leader/set-key "e" 'pp-eval-last-sexp)
(evil-leader/set-key "x" 'helm-M-x)
(evil-leader/set-key "p" 'projectile-command-map)

(define-key evil-normal-state-map [escape] 'keyboard-quit)
(define-key evil-visual-state-map [escape] 'keyboard-quit)
(define-key minibuffer-local-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-ns-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-completion-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-must-match-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-isearch-map [escape] 'minibuffer-keyboard-quit)
(define-key company-mode-map [escape] 'company-abort)

(define-key evil-normal-state-map "gf" 'projectile-find-file-dwim)
(define-key evil-normal-state-map "gF" 'projectile-find-file-dwim-other-window)
(define-key evil-normal-state-map "gb" 'ido-switch-buffer)
(define-key evil-normal-state-map "gc" 'recompile)
(define-key evil-normal-state-map "gt" 'eshell)
(define-key evil-normal-state-map "gk" 'ido-kill-buffer)
(define-key evil-normal-state-map [f5] 'recompile)

(evil-set-initial-state 'nav-mode 'emacs)
(evil-set-initial-state 'grep-mode 'emacs)

(evil-make-overriding-map ggtags-mode-map 'normal)
;; force update evil keymaps after ggtags-mode loaded
(add-hook 'ggtags-mode-hook #'evil-normalize-keymaps)
(define-key evil-normal-state-map (kbd "C-]") 'ggtags-find-tag-dwim)

(eval-after-load 'dired-x
  '(progn
     (evil-leader/set-key "h" 'dired-jump)
     ))

(defun my:dired-up-directory ()
  "Take dired up one directory, but behave like dired-find-alternate-file"
  (interactive)
  (let ((old (current-buffer)))
    (dired-up-directory)
    (kill-buffer old)
    ))

(evil-define-key 'normal dired-mode-map "h" 'my:dired-up-directory)
(evil-define-key 'normal dired-mode-map "l" 'dired-find-alternate-file)
(evil-define-key 'normal dired-mode-map "o" 'dired-sort-toggle-or-edit)
(evil-define-key 'normal dired-mode-map "v" 'dired-toggle-marks)
(evil-define-key 'normal dired-mode-map "m" 'dired-mark)
(evil-define-key 'normal dired-mode-map "u" 'dired-unmark)
(evil-define-key 'normal dired-mode-map "U" 'dired-unmark-all-marks)
(evil-define-key 'normal dired-mode-map "c" 'dired-create-directory)
(evil-define-key 'normal dired-mode-map "n" 'evil-search-next)
(evil-define-key 'normal dired-mode-map "N" 'evil-search-previous)
(evil-define-key 'normal dired-mode-map "q" 'kill-this-buffer)

;; Make HJKL keys work in special buffers
;(evil-set-initial-state 'magit-mode 'normal)
;(evil-set-initial-state 'magit-status-mode 'normal)
;(evil-set-initial-state 'magit-diff-mode 'normal)
;(evil-set-initial-state 'magit-log-mode 'normal)

;     (eval-after-load 'magit-mode
;       '(progn
;	  (evil-add-hjkl-bindings magit-log-mode-map 'normal)
;	  (evil-add-hjkl-bindings magit-commit-mode-map 'normal)
;	  (evil-add-hjkl-bindings magit-branch-manager-mode-map 'normal
;	    "K" 'magit-discard-item
;	    "L" 'magit-key-mode-popup-logging)
;	  (evil-add-hjkl-bindings magit-status-mode-map 'normal
;	    "K" 'magit-discard-item
;	    "L" 'magit-key-mode-popup-logging)
;
;	  (evil-define-key 'normal magit-status-mode-map
;	    "j" 'magit-section-forward
;	    "k" 'magit-section-backward)
;	  (evil-define-key 'normal magit-mode-map
;	    "j" 'magit-section-forward
;	    "k" 'magit-section-backward)
;	  (evil-define-key 'normal magit-log-mode-map
;	    "j" 'magit-section-forward
;	    "k" 'magit-section-backward)
;	  (evil-define-key 'normal magit-diff-mode-map
;	    "j" 'magit-section-forward
;	    "k" 'magit-section-backward)
;	  ))

(evil-add-hjkl-bindings occur-mode 'emacs)


(evil-set-initial-state 'ibuffer-mode 'normal)
(evil-define-key 'normal ibuffer-mode-map
  (kbd "m") 'ibuffer-mark-forward
  (kbd "t") 'ibuffer-toggle-forward
  (kbd "u") 'ibuffer-unmark-forward
  (kbd "=") 'ibuffer-diff-with-file
  (kbd "J") 'ibuffer-jump-to-buffer
  (kbd "M-g") 'ibuffer-jump-to-buffer
  (kbd "M-s a C-s") 'ibuffer-do-isearch
  (kbd "M-s a M-C-s") 'ibuffer-do-isearch-regexp
  (kbd "j") 'evil-next-line
  (kbd "k") 'evil-previous-line
  (kbd "l") 'ibuffer-visit-buffer
  (kbd "v") 'ibuffer-toggle-marks)

(define-key c-mode-base-map (kbd "C-c C-g") '(lambda ()(interactive)
					       (gud-gdb (concat "gdb --fullname " (cppcm-get-exe-path-current-buffer)))))

(define-key go-mode-map (kbd "C-c i") 'go-goto-imports)

(add-hook 'go-mode-hook (lambda ()
			  (define-key evil-normal-state-map "gd" 'godef-jump)
			  (define-key evil-normal-state-map "gr" 'go-remove-unused-imports)
			  (define-key evil-normal-state-map "ga" 'go-import-add)))

(provide 'sjb-keybinding)
