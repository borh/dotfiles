(use-package flycheck
  ;; :preface
  ;; (global-flycheck-mode t)
  :config
  (use-package flycheck-status-emoji)
  (flycheck-clojure-setup)
  (flycheck-pos-tip-mode)
  (setq flycheck-display-errors-function #'flycheck-pos-tip-error-messages))
