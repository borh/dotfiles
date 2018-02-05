(use-package
  elpy
  :config
  (elpy-enable)
  (setq python-shell-interpreter "ipython3"
        python-shell-interpreter-args "--simple-prompt --pprint"))

(use-package pipenv
  :ensure nil
  :init
  (setq
   pipenv-projectile-after-switch-function
   #'pipenv-projectile-after-switch-extended)
  :config
  (add-hook 'python-mode-hook #'pipenv-mode))
