(ensure-package-installed 'engine-mode)

(require 'engine-mode)
(engine-mode)
;(setq engine/browser-function 'eww-browse-url)

(defengine duckduckgoog
  "http://duckduckgoog.com/?q=%s"
  :keybinding "d")
(defengine github
  "https://github.com/search?ref=simplesearch&q=%s"
  :keybinding "g")

(provide 'init-engine-mode)
