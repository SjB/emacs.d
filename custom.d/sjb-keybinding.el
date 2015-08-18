;; SjB Alias
(defalias 'b 'helm-mini)
(defalias 'rof 'recentf-open-files)
(defalias 'hlm 'hl-line-mode)
(defalias 'gf 'grep-find)
(defalias 'fd 'find-dired)
(defalias 'dtw 'delete-trailing-whitespace)


;; SjB keybinding file
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "M-/") 'hippie-expand)
(global-set-key (kbd "M-p") 'projectile-command-map)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-x b") 'helm-mini)
(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "C-x M-g") 'magit-dispatch-popup)
(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "C-r") 'isearch-backward-regexp)
(global-set-key (kbd "C-M-s") 'isearch-forward)
(global-set-key (kbd "C-M-r") 'isearch-backward)

(global-set-key (kbd "C-c a") 'ace-window)
(global-set-key (kbd "C-c SPC") 'ace-jump-mode)

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

(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebind tab to run persistent action
(define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB works in terminal
(define-key helm-map (kbd "C-z")  'helm-select-action) ; list actions using C-z

(define-prefix-command 'sjb-local-file-map)

(evil-leader/set-key
  "w" 'save-buffer
  "q" 'kill-buffer-and-window
  "x" 'helm-M-x
  "h" 'dired-jump
  "b" 'helm-mini
  "e" 'sjb-local-file-map
  )

(define-key sjb-local-file-map "e" '(lambda () (interactive) (open-note "emacs-cheatsheet")))
(define-key sjb-local-file-map "n" '(lambda () (interactive) (open-note "nca-journals")))
(define-key sjb-local-file-map "s" '(lambda () (interactive) (open-note "sagacity-journal")))

(define-key web-mode-map (kbd "C-c r") 'mc/mark-sgml-tag-pair)
(define-key web-mode-map (kbd "C-c <delete>") 'sgml-delete-tag)
(define-key web-mode-map (kbd "%") 'web-mode-match-paren)

; remap C-w in magit-mode to evil-window-map
(eval-after-load 'magit-mode
  '(progn
     (define-key magit-mode-map (kbd "C-w") 'evil-window-map)
     (define-key magit-mode-map (kbd "M-S-w") 'magit-copy-buffer-thing-as-kill)
     (define-key magit-mode-map (kbd "M-w") 'magit-copy-as-kill)))

; multiple-cursors keybinding
(define-prefix-command 'sjb-multi-cursor-map)
(evil-define-key 'visual region-bindings-mode-map (kbd ",m") 'sjb-multi-cursor-map)

(define-key sjb-multi-cursor-map (kbd "a") 'mc/mark-all-like-this)
(define-key sjb-multi-cursor-map (kbd "p") 'mc/mark-previous-like-this)
(define-key sjb-multi-cursor-map (kbd "n") 'mc/mark-next-like-this)
(define-key sjb-multi-cursor-map (kbd "m") 'mc/mark-more-like-this-extended)
(define-key sjb-multi-cursor-map (kbd "s") 'mc/skip-to-next-like-this)
(define-key sjb-multi-cursor-map (kbd "S") 'mc/skip-to-previous-like-this)
(define-key sjb-multi-cursor-map (kbd "u") 'mc/unmark-next-like-this)
(define-key sjb-multi-cursor-map (kbd "U") 'mc/unmark-previous-like-this)
(define-key sjb-multi-cursor-map (kbd "e") 'mc/edit-lines)
(define-key sjb-multi-cursor-map (kbd "0") 'mc/edit-beginnings-of-lines)
(define-key sjb-multi-cursor-map (kbd "$") 'mc/edit-ends-of-lines)
(define-key sjb-multi-cursor-map (kbd "r") 'mc/mark-all-in-region)
(define-key sjb-multi-cursor-map (kbd "#") 'mc/mark-all-dwin)
(define-key sjb-multi-cursor-map (kbd "@") 'set-rectangular-region-anchor)
(define-key sjb-multi-cursor-map (kbd "in") 'mc/insert-numbers)
(define-key sjb-multi-cursor-map (kbd "'") 'mc/sort-regions)
(define-key sjb-multi-cursor-map (kbd "\"") 'mc/reverse-regions)

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

(define-key evil-normal-state-map "gf" 'projectile-find-file-dwim)
(define-key evil-normal-state-map "gF" 'projectile-find-file-dwim-other-window)
(define-key evil-normal-state-map "gb" 'ido-switch-buffer)
(define-key evil-normal-state-map "gc" 'recompile)
(define-key evil-normal-state-map "gt" 'eshell)
(define-key evil-normal-state-map "gk" 'ido-kill-buffer)
(define-key evil-normal-state-map [f5] 'recompile)

(evil-set-initial-state 'nav-mode 'emacs)
(evil-set-initial-state 'grep-mode 'emacs)

(evil-add-hjkl-bindings occur-mode 'emacs)

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

;; helm gtags
(define-key evil-normal-state-map (kbd "C-]") 'helm-gtags-dwin)
(define-key evil-normal-state-map (kbd "C-t") 'helm-gtags-pop-stack)
;(define-key c-mode-base-map (kbd "C-]") 'helm-gtags-dwim)
;(define-key c-mode-base-map (kbd "C-t") 'helm-gtags-pop-stack)

;; ggtags binding
(define-key ggtags-mode-map (kbd "C-c h g") 'ggtags-create-tags)
(define-key ggtags-mode-map (kbd "C-c h u") 'ggtags-update-tags)
(evil-make-overriding-map ggtags-mode-map 'normal)
;; force update evil keymaps after ggtags-mode loaded
(add-hook 'ggtags-mode-hook #'evil-normalize-keymaps)

;; golang mode keybinding
(define-key go-mode-map (kbd "C-c i") 'go-goto-imports)
(evil-define-key 'normal go-mode-map
  "gd" 'godef-jump
  "gr" 'go-remove-unused-imports
  "ga" 'go-import-add)

(provide 'sjb-keybinding)
