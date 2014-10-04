(eval-after-load "clojure-mode"
      '(progn
         (setq initial-scratch-message nil) ; *scratch* starts empty
         (when (locate-library "clojure-mode") ; Set *scratch* to Clojure mode
           (setq initial-major-mode 'clojure-mode))

         (setq auto-mode-alist (cons '("\\.edn$" . clojure-mode) auto-mode-alist)) ; *.edn are Clojure files
         (setq auto-mode-alist (cons '("\\.cljs$" . clojure-mode) auto-mode-alist)) ; *.cljs are Clojure files

         (font-lock-add-keywords
          'clojure-mode `(("(\\(fn\\)[\[[:space:]]"
                           (0 (progn (compose-region (match-beginning 1)
                                                     (match-end 1) "ƒ") ; λ
                                     nil)))))
         (font-lock-add-keywords
          'clojure-mode `(("\\(#\\)("
                           (0 (progn (compose-region (match-beginning 1)
                                                     (match-end 1) "ƒ")
                                     nil)))))

         (font-lock-add-keywords
          'clojure-mode `(("\\(#\\){"
                           (0 (progn (compose-region (match-beginning 1)
                                                     (match-end 1) "∈")
                                     nil)))))

         (font-lock-add-keywords
          'clojure-mode `(("(\\(partial\\)[[:space:]]"
                           (0 (progn (compose-region (match-beginning 1)
                                                     (match-end 1) "Ƥ")
                                     nil)))))

         (font-lock-add-keywords
          'clojure-mode `(("(\\(comp\\)[[:space:]]"
                     (0 (progn (compose-region (match-beginning 1)
                                               (match-end 1) "∘")
                               nil)))))

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
           (for-map 2)
           (GET 2)
           (POST 2)
           (PUT 2)
           (DELETE 2)
           (HEAD 2)
           (ANY 2)
           (context 2))

         ;; kibit integration
         ;; Teach compile the syntax of the kibit output
         (require 'compile)
         (add-to-list 'compilation-error-regexp-alist-alist
                      '(kibit "At \\([^:]+\\):\\([[:digit:]]+\\):" 1 2 nil 0))
         (add-to-list 'compilation-error-regexp-alist 'kibit)

         ;; A convenient command to run "lein kibit" in the project to which
         ;; the current emacs buffer belongs to.
         (defun kibit ()
           "Run kibit on the current project.
           Display the results in a hyperlinked *compilation* buffer."
           (interactive)
           (compile "lein kibit"))

         ;; ;; clj-refactor
         ;; (require 'clj-refactor)
         ;; (setq cljr-sort-comparator 'cljr--semantic-comparator)
         ;; (add-hook 'clojure-mode-hook (lambda ()
         ;;                                (clj-refactor-mode 1)
         ;;                                (cljr-add-keybindings-with-prefix "C-c C-m")))

         ;; Flyspell
         (require 'flyspell)
         (add-hook 'clojure-mode-hook (lambda ()
                                        (flyspell-prog-mode)))))
