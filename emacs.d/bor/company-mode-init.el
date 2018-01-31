(use-package company
  :config
  (setq company-tooltip-align-annotations t)
  (setq company-math-allow-latex-symbols-in-faces t)
  (add-hook 'after-init-hook 'global-company-mode))

(use-package
  company-jedi
  :config
  (defun my/python-mode-hook ()
    (add-to-list 'company-backends 'company-jedi))
  (add-hook 'python-mode-hook 'my/python-mode-hook))

(use-package
  company-auctex
  :config
  (company-auctex-init))

(use-package company-math
  :config
  (add-to-list 'company-backends 'company-math-symbols-unicode))

(use-package company-ansible)

(use-package company-bibtex
  :config
  (setq company-bibtex-bibliography
        '("/home/bor/Projects/homepage/content/bibliography.bib"))
  (add-to-list 'company-backends 'company-bibtex))

(use-package company-web
  :config
  (add-to-list 'company-backends 'company-web-html))
