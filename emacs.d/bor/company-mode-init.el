;; (use-package company
;;   :config
;;
;;   (use-package
;;     company-jedi
;;     :config
;;     (defun my/python-mode-hook ()
;;       (add-to-list 'company-backends 'company-jedi))
;;
;;     (add-hook 'python-mode-hook 'my/python-mode-hook))
;;
;;   (use-package
;;     company-auctex
;;     :config
;;     (company-auctex-init))
;;
;;   ;; (use-package
;;   ;;   company-math
;;   ;;   :config
;;   ;;   (add-to-list 'company-backends 'company-math-symbols-unicode))
;;
;;   (setq company-tooltip-align-annotations t)
;;
;;   (add-hook 'after-init-hook 'global-company-mode))
