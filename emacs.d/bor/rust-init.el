(use-package
  cargo
  :config
  (add-hook 'rust-mode-hook 'cargo-minor-mode))

(use-package
  flycheck-rust
  :config
  (add-hook 'flycheck-mode-hook #'flycheck-rust-setup))
