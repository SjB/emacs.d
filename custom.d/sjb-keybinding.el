;; SjB Alias
(defalias 'hlm 'hl-line-mode)
(defalias 'hgrep 'helm-do-grep)
(defalias 'pgrep 'helm-projectile-grep)
(defalias 'pack  'helm-projectile-ack)
(defalias 'dtw 'delete-trailing-whitespace)
(defalias 'ddg 'engine/search-duckduckgoog)
(defalias 'gh 'engine/search-github)
(defalias 'goog 'helm-google-suggest)
(defalias 'ws 'helm-surfraw)

;; SjB keybinding file
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "M-/") 'hippie-expand)
(global-set-key (kbd "M-p") 'projectile-command-map)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-x b") 'helm-mini)
(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "C-r") 'isearch-backward-regexp)
(global-set-key (kbd "C-M-s") 'isearch-forward)
(global-set-key (kbd "C-M-r") 'isearch-backward)

(global-set-key (kbd "C-x o") 'ace-window)
(global-set-key (kbd "C-c a") 'ace-jump-mode)

(global-set-key (kbd "M-*") 'select-text-in-quote)

; expand region
(global-set-key (kbd "C-=") 'er/expand-region)

; start helm from company-mode
(define-key company-mode-map (kbd "C-`") 'helm-company)
(define-key company-active-map (kbd "C-`") 'helm-company)

; helm keybinding
(global-set-key (kbd "C-c y") 'helm-yas-complete)
(global-set-key (kbd "C-c h") 'helm-command-prefix)
(global-unset-key (kbd "C-x c"))
(global-set-key (kbd "C-c C-n") 'cleanup-buffer)

(define-prefix-command 'sjb/notes-map)
(define-key sjb/notes-map "e" 'note/emacs-cheatsheet)
(define-key sjb/notes-map "n" 'note/nca-journals)
(define-key sjb/notes-map "s" 'note/sagacity-journals)

(define-prefix-command 'sjb/magit-map)
(define-key sjb/magit-map "s" 'magit-status)
(define-key sjb/magit-map "b" 'magit-blame-popup)
(define-key sjb/magit-map "l" 'magit-log-popup)
(define-key sjb/magit-map "d" 'magit-diff-popup)
(define-key sjb/magit-map "z" 'magit-stash-popup)
(define-key sjb/magit-map "c" 'magit-commit-popup)

(global-set-key (kbd "C-c e") 'sjb/notes-map)
(global-set-key (kbd "C-c g") 'sjb/magit-map)

(evil-leader/set-key
  "w" 'save-buffer
  "q" 'kill-buffer-and-window
  "x" 'helm-M-x
  "h" 'dired-jump
  "b" 'helm-mini
  "e" 'sjb/notes-map
  "g" 'sjb/magit-map
  )


(eval-after-load 'gist-list
  '(progn
     (define-key gist-list-menu-mode-map (kbd "C-w") 'evil-window-map)
     (define-key gist-list-mode-map (kbd "C-w") 'evil-window-map)
     ))

; multiple-cursors keybinding
(define-prefix-command 'sjb/multi-cursor-map)
(evil-define-key 'visual region-bindings-mode-map (kbd ",m") 'sjb/multi-cursor-map)
(global-set-key (kbd "C-c m") 'sjb/multi-cursor-map)

(define-key sjb/multi-cursor-map (kbd "a") 'mc/mark-all-like-this)
(define-key sjb/multi-cursor-map (kbd "p") 'mc/mark-previous-like-this)
(define-key sjb/multi-cursor-map (kbd "n") 'mc/mark-next-like-this)
(define-key sjb/multi-cursor-map (kbd "m") 'mc/mark-more-like-this-extended)
(define-key sjb/multi-cursor-map (kbd "s") 'mc/skip-to-next-like-this)
(define-key sjb/multi-cursor-map (kbd "S") 'mc/skip-to-previous-like-this)
(define-key sjb/multi-cursor-map (kbd "t") 'mc/mark-sgml-tag-pair)
(define-key sjb/multi-cursor-map (kbd "u") 'mc/unmark-next-like-this)
(define-key sjb/multi-cursor-map (kbd "U") 'mc/unmark-previous-like-this)
(define-key sjb/multi-cursor-map (kbd "e") 'mc/edit-lines)
(define-key sjb/multi-cursor-map (kbd "0") 'mc/edit-beginnings-of-lines)
(define-key sjb/multi-cursor-map (kbd "$") 'mc/edit-ends-of-lines)
(define-key sjb/multi-cursor-map (kbd "r") 'mc/mark-all-in-region)
(define-key sjb/multi-cursor-map (kbd "#") 'mc/mark-all-dwim)
(define-key sjb/multi-cursor-map (kbd "@") 'set-rectangular-region-anchor)
(define-key sjb/multi-cursor-map (kbd "in") 'mc/insert-numbers)
(define-key sjb/multi-cursor-map (kbd "'") 'mc/sort-regions)
(define-key sjb/multi-cursor-map (kbd "\"") 'mc/reverse-regions)

(global-set-key (kbd "C-c @") 'set-rectangular-region-anchor)
(global-set-key (kbd "C-c #") 'mc/mark-all-dwim)

(define-key evil-insert-state-map (kbd "C-w") 'evil-window-map)

(define-key evil-window-map "a" 'ace-window)
(define-key evil-normal-state-map [escape] 'keyboard-quit)
(define-key evil-visual-state-map [escape] 'keyboard-quit)
(define-key minibuffer-local-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-ns-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-completion-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-must-match-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-isearch-map [escape] 'minibuffer-keyboard-quit)
(define-key company-mode-map [escape] 'company-abort)

(define-key evil-normal-state-map (kbd "g f") 'projectile-find-file-dwim)
(define-key evil-normal-state-map (kbd "g F") 'projectile-find-file-dwim-other-window)
(define-key evil-normal-state-map (kbd "g b") 'ido-switch-buffer)
(define-key evil-normal-state-map (kbd "g c") 'recompile)
(define-key evil-normal-state-map (kbd "g t") 'eshell)
(define-key evil-normal-state-map (kbd "g k") 'ido-kill-buffer)
(define-key evil-normal-state-map [f5] 'recompile)

(evil-set-initial-state 'nav-mode 'emacs)
(evil-set-initial-state 'grep-mode 'emacs)

(defun my:dired-up-directory ()
  "Take dired up one directory, but behave like dired-find-alternate-file"
  (interactive)
  (let ((old (current-buffer)))
    (dired-up-directory)
    (kill-buffer old)
    ))

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

(provide 'sjb-keybinding)
