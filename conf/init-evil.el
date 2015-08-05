;; evil settings
(require 'evil)
(evil-mode t)

(evil-set-initial-state 'magit-log-edit-mode 'emacs)
(evil-set-initial-state 'nav-mode 'emacs)
(evil-set-initial-state 'grep-mode 'emacs)
(evil-set-initial-state 'ibuffer-mode 'normal)

;; Make HJKL keys work in special buffers
(eval-after-load 'magit-mode
  '(progn
     (evil-add-hjkl-bindings magit-branch-manager-mode-map 'emacs
       "K" 'magit-discard-item
       "L" 'magit-key-mode-popup-logging)
     (evil-add-hjkl-bindings magit-status-mode-map 'emacs
       "K" 'magit-discard-item
       "l" 'magit-key-mode-popup-logging
       "h" 'magit-toggle-diff-refine-hunk)
     (evil-add-hjkl-bindings magit-log-mode-map 'emacs)
     (evil-add-hjkl-bindings magit-commit-mode-map 'emacs)
     ))
(eval-after-load 'occur-mode
  '(progn
     (evil-add-hjkl-bindings occur-mode 'emacs)
     ))

(require 'evil-surround)
(global-evil-surround-mode t)

(require 'evil-jumper)
(global-evil-jumper-mode t)

(require 'evil-leader)
(global-evil-leader-mode t)
(evil-leader/set-leader ",")

(require 'evil-matchit)

(require 'evil-easymotion)
(evilem-default-keybindings "SPC")

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
       (kbd "v") 'ibuffer-toggle-marks)))

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

(eval-after-load 'dired-x
  '(progn
     (evil-leader/set-key "h" 'dired-jump)
     ))


(evil-leader/set-key "w" 'save-buffer)
(evil-leader/set-key "q" 'kill-buffer-and-window)
(evil-leader/set-key "v" 'split-window-right)
(evil-leader/set-key "e" 'pp-eval-last-sexp)
(evil-leader/set-key "," 'other-window)
(evil-leader/set-key "b" 'helm-buffers-list)
(evil-leader/set-key "x" 'helm-M-x)
