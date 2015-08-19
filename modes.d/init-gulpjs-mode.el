(add-to-list 'load-path (expand-file-name "extra/gulpjs" user-emacs-directory))

(autoload 'gulpjs-start-task "gulpjs" "Start a gulp task." t)

(provide 'init-gulpjs-mode)
