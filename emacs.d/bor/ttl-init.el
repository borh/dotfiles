(use-package
  ttl-mode
  :config
  (add-hook 'ttl-mode-hook    ; Turn on font lock when in ttl mode
            'turn-on-font-lock)
  (setq auto-mode-alist
        (append
         (list
          ;;'("\\.n3" . ttl-mode)
          '("\\.ttl" . ttl-mode))
         auto-mode-alist)))

(use-package
  n3-mode
  :config
  (setq auto-mode-alist
        (append
         (list
          '("\\.n3" . n3-mode)
          '("\\.owl" . n3-mode))
         auto-mode-alist)))

(use-package
  sparql-mode
  :config
  (setq auto-mode-alist
        (append
         (list
          '("\\.sparql" . sparql-mode)
          '("\\.rq" . sparql-mode))
         auto-mode-alist)))
