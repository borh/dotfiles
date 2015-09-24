(global-flycheck-mode)
(eval-after-load "flycheck-mode"
  '(progn
     (require 'flycheck-status-emoji)
     (flycheck-clojure-setup)
     (setq flycheck-display-errors-function #'flycheck-pos-tip-error-messages)))
