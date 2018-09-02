(use-package ein
  :defer t
  :config
  (require 'ein-loaddefs)
  (require 'ein-notebook)
  (require 'ein-subpackages)

  (setq ein:console-args '("--ssh" "gpgpu-remote"))
  (setq ein:console-security-dir "/home/bor/.jupyter/")

  (add-hook 'ein:connect-mode-hook 'ein:jedi-setup))
