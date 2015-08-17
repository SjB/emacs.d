(ensure-package-installed 'flycheck)

(require 'flycheck)
(add-hook 'after-init-hook #'global-flycheck-mode)

(flycheck-define-checker php-flycheck-reporter
  "A PHP syntax checker using the PHP command line interpreter.

See URL `http://php.net/manual/en/features.commandline.php'."
  :command ("php" "-l" "-d" "error_reporting=E_ALL" "-d" "display_errors=1"
	    "-d" "log_errors=0" source)
  :error-patterns ((error line-start
			  (or "Parse" "Fatal" "syntax") " error" (any ":" ",") " "
			  (message) " in " (file-name) " on line " line line-end))
  :modes (php-mode php+mode web-mode))

(add-hook 'web-mode-hook (lambda ()
			   (flycheck-select-checker 'php-flycheck-reporter)))

(provide 'init-flycheck-mode)
