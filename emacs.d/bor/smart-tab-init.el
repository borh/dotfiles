(use-package smart-tabs-mode
  :ensure t
  :config
  ;; (autoload 'smart-tabs-mode "smart-tabs-mode"
  ;;   "Intelligently indent with tabs, align with spaces!")
  ;; (autoload 'smart-tabs-mode-enable "smart-tabs-mode")
  ;; (autoload 'smart-tabs-advice "smart-tabs-mode")

  ;; C/C++
  (add-hook 'c-mode-hook 'smart-tabs-mode-enable)
  (smart-tabs-advice c-indent-line c-basic-offset)
  (smart-tabs-advice c-indent-region c-basic-offset)

  ;; JavaScript
  (add-hook 'js2-mode-hook 'smart-tabs-mode-enable)
  ;;(smart-tabs-advice js2-indent-line js2-basic-offset) ; error?
  (add-hook 'js3-mode-hook 'smart-tabs-mode-enable)
  (smart-tabs-advice js3-indent-line js3-basic-offset)

  ;; Perl (cperl-mode)
  (add-hook 'cperl-mode-hook 'smart-tabs-mode-enable)
  (smart-tabs-advice cperl-indent-line cperl-indent-level)

  ;; Python
  (add-hook 'python-mode-hook 'smart-tabs-mode-enable)
  (smart-tabs-advice python-indent-line-1 python-indent)

  ;; Ruby
  (add-hook 'ruby-mode-hook 'smart-tabs-mode-enable)
  (smart-tabs-advice ruby-indent-line ruby-indent-level))

(use-package smart-backspace
  :config
  (global-set-key [?\C-?] 'smart-backspace))
