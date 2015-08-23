(defun open-note (&optional name)
  (interactive "sEnter Note's name: ")
  (find-file (expand-file-name (concat name ".md") "~/Dropbox/Notes/")))

(defun note/emacs-cheatsheet ()
  (interactive)
  (open-note "emacs-cheatsheet"))

(defun note/nca-journals ()
  (interactive)
  (open-note "nca-journals"))

(defun note/sagacity-journals ()
  (interactive)
  (open-note "sagacity-journals"))

(provide 'sjb-notes)
