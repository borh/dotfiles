(use-package julia-mode)
(use-package julia-shell)
(use-package
  flycheck-julia
  :config
  (flycheck-julia-setup)
  (add-to-list 'flycheck-global-modes 'julia-mode)
  (add-to-list 'flycheck-global-modes 'ess-julia-mode))
