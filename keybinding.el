;; SjB keybinding file

(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "C-x M-g") 'magit-dispatch-popup)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x o") 'ace-window)
(global-set-key (kbd "C-x b") 'helm-mini)
(global-set-key (kbd "M-p") 'projectile-command-map)

(define-key evil-window-map "a" 'ace-window)

(evil-leader/set-key "w" 'save-buffer)
(evil-leader/set-key "q" 'kill-buffer-and-window)
(evil-leader/set-key "v" 'split-window-right)
(evil-leader/set-key "e" 'pp-eval-last-sexp)
(evil-leader/set-key "," 'ace-window)
(evil-leader/set-key "b" 'helm-mini)
(evil-leader/set-key "x" 'helm-M-x)

(evil-set-initial-state 'nav-mode 'emacs)
(evil-set-initial-state 'grep-mode 'emacs)

(eval-after-load 'dired-x
  '(progn
     (evil-leader/set-key "h" 'dired-jump)
     ))

(eval-after-load 'dired
  '(progn
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
     ))

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

(eval-after-load 'occur-mode
  '(progn
     (evil-add-hjkl-bindings occur-mode 'emacs)
     ))


(eval-after-load 'ibuffer
  '(progn
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
     ))

(provide 'sjb-keybinding)
