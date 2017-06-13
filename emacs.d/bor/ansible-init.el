(use-package
  ansible
  :config
  (use-package ansible-vault
    :config
    (defun ansible-vault-mode-maybe ()
      (when (ansible-vault--is-vault-file)
        (ansible-vault-mode 1)))
    :init
    (add-hook 'yaml-mode-hook 'ansible-vault-mode-maybe)))
