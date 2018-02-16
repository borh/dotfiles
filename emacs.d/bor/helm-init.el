(use-package helm
  :config
  (global-set-key (kbd "M-x") 'helm-M-x)
  (global-set-key (kbd "C-x C-f") #'helm-find-files)
  (helm-mode 1))

(use-package linum-relative
  :config
  (helm-linum-relative-mode 1))

(use-package helm-ls-git
  :config
  (global-set-key (kbd "C-x C-d") 'helm-browse-project)
  (global-set-key (kbd "C-<f6>") 'helm-ls-git-ls))

(use-package helm-rg
  :config
  (global-set-key (kbd "C-<f1>") 'helm-rg))
