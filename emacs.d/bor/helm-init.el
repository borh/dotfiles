(use-package helm
  :config
  (global-set-key (kbd "M-x") 'helm-M-x)
  (global-set-key (kbd "C-x C-f") #'helm-find-files)
  (helm-mode 1))

(use-package linum-relative
  :config
  (helm-linum-relative-mode 1))

(use-package helm-ls-git)
