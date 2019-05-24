(use-package projectile
  :ensure t
  :config
  (define-key projectile-mode-map (kbd "M-p") 'projectile-command-map)
  (projectile-mode +1))

(use-package ripgrep
  :ensure t)
