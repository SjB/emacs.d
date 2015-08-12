(require 'package)

(defun init-package-system ()
   (when (>= emacs-major-version 24)
       (message "Emacs %s - init packages" emacs-version)

       (or (file-exists-p package-user-dir) (package-refresh-contents))

       (package-initialize))

(defun ensure-package-installed (&rest packages)
  " Assure every package is installed, ask for installation if it's not.
    Return a list of installed packages or nil for every skipped package."
        (mapcar
	#'(lambda (package)
	    (message "Searching %s..." package)
	    (if (package-installed-p package)
		nil
	      (package-install package)
	      package))
	packages)))

(defun load-directory (dir)
  (add-to-list 'load-path dir)
  (mapc #'(lambda (file)
	    (load-library (file-name-sans-extension file)))
	(directory-files dir () ".*\\.el$")))

(provide 'script)
