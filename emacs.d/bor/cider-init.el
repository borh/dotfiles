(use-package cider
  :ensure t
  :defer t
  :config
  (add-hook 'cider-mode-hook #'eldoc-mode)

  (setq nrepl-log-messages t)
  (setq nrepl-hide-special-buffers t)

  (add-hook 'cider-repl-mode-hook #'smartparens-strict-mode)
  (add-hook 'cider-interaction-mode-hook #'cider-turn-on-eldoc-mode)

  (setq cider-eldoc-display-context-dependent-info t)

  (add-hook 'cider-repl-mode-hook #'subword-mode)

  (setq cider-popup-stacktraces t)
  (setq cider-popup-stacktraces-in-repl t)
  (setq cider-stacktrace-default-filters '(tooling dup repl))

  (setq cider-auto-select-error-buffer t)
  (setq cider-stacktrace-default-filters nil)
  (setq cider-save-file-on-load t)
  (setq cider-repl-toggle-print-length-limiting t)
  (setq cider-repl-print-length 100)
  (setq cider-repl-toggle-pretty-printing t)
  ;; (setq cider-pprint-fn
  ;;       ;; "puget.printer/pprint"
  ;;       "clojure.pprint/pprint"
  ;;       )

  (setq cider-overlays-use-font-lock t)

  (setq cider-use-tooltips t) ;; FIXME

  (add-hook 'cider-repl-mode-hook #'company-mode)
  (add-hook 'cider-mode-hook #'company-mode)

  (add-to-list 'auto-mode-alist '("\\.boot\\'" . clojure-mode))

  (setq cider-clojure-cli-global-options "-Atest:pp")

  (define-key cider-repl-mode-map (kbd "C-c M-o") 'cider-repl-clear-buffer)

  (defun cider-repl-reset ()
    (interactive)
    (save-some-buffers)
    (with-current-buffer (cider-current-repl-buffer)
      (goto-char (point-max))
      (insert "(user/reset)")
      (cider-repl-return)))

  (define-key cider-repl-mode-map (kbd "M-r") 'cider-repl-reset)

  ;; Help with alignment
  (use-package align-cljlet)

  (use-package clj-refactor
    :config
    (dolist
        (hook '(clojure-mode-hook
                cider-nrepl-mode-hook
                lisp-mode
                javascript-mode))
      (add-hook hook
                '(lambda ()
                   (cider-mode t)
                   (clj-refactor-mode 1)
                   (yas-minor-mode 1)
                   (auto-complete-mode t)
                   (rainbow-delimiters-mode t)
                   (smartparens-strict-mode t))))
    (add-hook 'cider-mode-hook 'eldoc-mode))

  (use-package hugsql-ghosts
    :config
    (add-hook 'cider-mode-hook 'hugsql-ghosts-install-hook)))

(use-package clojure-mode-extra-font-locking ; Font-locking for Clojure mode
  :ensure t
  :defer t
  :after clojure-mode)

(use-package clojure-snippets           ; Yasnippets for Clojure
  :ensure t
  :defer t
  :after clojure-mode)

(use-package datomic-snippets           ; Yasnippets for Datomic
  :ensure t
  :defer t
  :after clojure-mode)
