(use-package
  elpy
  :config
  (elpy-enable)
  (setq python-shell-interpreter "ipython3"
        python-shell-interpreter-args "--simple-prompt --pprint"))
