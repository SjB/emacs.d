;; codenotes-highlight
(add-hook 'prog-mode-hook
          (lambda ()
            (font-lock-add-keywords nil
                                    '(("\\<\\(NOTE\\|FIXME\\|TODO\\|BUG\\|HACK\\|REFACTOR\\|THE HORROR\\)" 1 font-lock-warning-face t)))))

(provide 'codenotes-highlight)
