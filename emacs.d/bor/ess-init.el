(use-package
  ess
  :config
  (require 'ess-site)
  (defun mdw-mode ()
    (ess-noweb-mode)
    (setq ess-noweb-default-code-mode 'ess-julia-mode)
    (setq ess-noweb-doc-mode 'markdown-mode))

  (setq auto-mode-alist (append (list (cons "\\.mdw$" 'mdw-mode))
                                auto-mode-alist)))
