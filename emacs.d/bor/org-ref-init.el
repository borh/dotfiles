(use-package
  org-ref
  :bind
  (("<f10>" . org-ref-open-bibtex-notes)
   ("<f11>" . org-ref-open-bibtex-pdf)
   ("<f12>" . org-ref-open-in-browse))
  :config
  (setq reftex-default-bibliography '("~/Dropbox/Org/Bibliography/bibliography.bib"))

  ;; see org-ref for use of these variables
  (setq org-ref-bibliography-notes "~/Dropbox/Org/Bibliography/Bibliography-Notes.org"
        org-ref-default-bibliography '("~/Dropbox/Org/Bibliography/bibliography.bib")
        org-ref-pdf-directory "~/Dropbox/Research/")

  (setq helm-bibtex-bibliography "~/Dropbox/Org/Bibliography/bibliography.bib")
  (setq helm-bibtex-library-path "~/Dropbox/Research/")

  (setq helm-bibtex-pdf-open-function 'org-open-file)

  (setq helm-bibtex-notes-path "~/Dropbox/Org/Bibliography/helm-bibtex-notes"))
