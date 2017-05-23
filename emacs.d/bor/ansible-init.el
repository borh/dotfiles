(use-package
  ansible
  :config
  (use-package ansible-vault
    :init
    (add-hook 'yaml-mode-hook 'ansible-vault-mode-maybe)))
