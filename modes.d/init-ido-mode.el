(ensure-package-installed
 'ido-vertical-mode
 'ido-ubiquitous
 'flx-ido)

;; ido settings
(require 'ido)
(require 'flx-ido)
(require 'ido-ubiquitous)
(require 'ido-vertical-mode)

(setq ido-enable-prefix nil
      ido-enable-flex-matching t
      ido-case-fold t ;; ignore case
      ido-auto-merge-work-directories-length -1 ;; disable auto-merge (it's confusing)
      ido-create-new-buffer 'always ;; create new files easily
      ido-everywhere t
      ido-use-faces t ;; I like visual matching (colors)
      )

;(setq ido-use-faces nil)
(add-to-list 'ido-ignore-files "\\.DS_Store")
(add-to-list 'ido-ignore-directories "\\.git")
(add-to-list 'ido-ignore-directories "\\.bzr")
(add-to-list 'ido-ignore-directories "\\.hg")
(add-to-list 'ido-ignore-directories "\\.svn")

;; Ido buffer intuitive navigation
;(add-hook 'ido-setup-hook '(lambda ()
;                             (define-key ido-completion-map "\C-h" 'ido-delete-backward-updir)
;                             (define-key ido-completion-map "\C-n" 'ido-next-match)
;                             (define-key ido-completion-map "\C-f" 'ido-next-match)
;                             (define-key ido-completion-map "\C-p" 'ido-prev-match)
;                             (define-key ido-completion-map "\C-b" 'ido-prev-match)
;                             (define-key ido-completion-map " " 'ido-exit-minibuffer)
;                             ))

(ido-mode t)
(ido-vertical-mode)
(ido-everywhere t)
(ido-ubiquitous-mode t)
(setq gc-cons-threshold 30000000)
(flx-ido-mode t)

(provide 'init-ido-mode)
