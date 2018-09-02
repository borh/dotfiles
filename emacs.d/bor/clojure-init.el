;; In case of compilation related issues:
;; (byte-recompile-directory package-user-dir nil 'force)

(use-package
  inf-clojure
  :config
  (setq inf-clojure-program "lumo"))

(use-package
  clojure-mode
  :config
  (setq initial-scratch-message nil) ; *scratch* starts empty
  (when (locate-library "clojure-mode") ; Set *scratch* to Clojure mode
    (setq initial-major-mode 'clojure-mode))

  (setq auto-mode-alist (cons '("\\.edn$" . clojure-mode) auto-mode-alist)) ; *.edn are Clojure files
  (setq auto-mode-alist (cons '("\\.cljs$" . clojure-mode) auto-mode-alist)) ; *.cljs are Clojure files
  (setq auto-mode-alist (cons '("\\.boot$" . clojure-mode) auto-mode-alist)) ; *.boot are Clojure files

  ;;Treat hyphens as a word character when transposing words
  (defvar clojure-mode-with-hyphens-as-word-sep-syntax-table
    (let ((st (make-syntax-table clojure-mode-syntax-table)))
      (modify-syntax-entry ?- "w" st)
      st))

  (defun live-transpose-words-with-hyphens (arg)
    "Treat hyphens as a word character when transposing words"
    (interactive "*p")
    (with-syntax-table clojure-mode-with-hyphens-as-word-sep-syntax-table
      (transpose-words arg)))

  (define-key clojure-mode-map (kbd "M-t") 'live-transpose-words-with-hyphens)

  ;; Fix alignment for special cases
  (define-clojure-indent
    (defroutes 'defun)
    (describe 'defun)
    (register-handler 'defun)
    (s/fdef 'defun)
    (fnk 'defun)
    (fn-traced 'defun)
    (s/defrecord 'defun)
    (s/defschema 'defun)
    (for-map 2)
    (GET 2)
    (POST 2)
    (PUT 2)
    (DELETE 2)
    (HEAD 2)
    (ANY 2)
    (context 2)))

(use-package
  clj-refactor
  :config
  (add-hook 'clojure-mode-hook
            (lambda ()
              (clj-refactor-mode 1)
              (cljr-add-keybindings-with-prefix "C-c C-m"))))

;; (use-package re-jump) ;; Not on MELPA yet.

(use-package flyspell)

(use-package
  flycheck-clojure
  :config
  ;; (flycheck-clojure-setup)
  ;; (add-hook 'clojure-mode-hook (lambda ()
  ;;                                (flyspell-prog-mode)))
  )

(use-package
  flycheck-pos-tip
  :config
  (setq flycheck-display-errors-function #'flycheck-pos-tip-error-messages))
