(eval-after-load "cider-mode"
  '(progn
     (require 'clj-refactor)
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

     (add-hook 'cider-mode-hook #'eldoc-mode)

     (setq nrepl-log-messages t)
     (setq nrepl-hide-special-buffers t)

     (add-hook 'cider-repl-mode-hook #'smartparens-strict-mode)
     (add-hook 'cider-interaction-mode-hook #'cider-turn-on-eldoc-mode)

     (add-hook 'cider-repl-mode-hook #'subword-mode)

     (setq cider-popup-stacktraces t)
     (setq cider-popup-stacktraces-in-repl t)
     (setq cider-stacktrace-default-filters '(tooling dup))

     (setq cider-auto-select-error-buffer t)
     (setq cider-stacktrace-default-filters nil)
     (setq cider-prompt-save-file-on-load nil)
     (setq cider-repl-toggle-print-length-limiting t)
     (setq cider-repl-print-length 100)
     (setq cider-repl-toggle-pretty-printing t)

     (add-hook 'cider-repl-mode-hook #'company-mode)
     (add-hook 'cider-mode-hook #'company-mode)

     (add-to-list 'auto-mode-alist '("\\.boot\\'" . clojure-mode))

     ;; (defun repl-reset ()
     ;;   (interactive)
     ;;   (save-some-buffers)
     ;;   (with-current-buffer (cider-current-repl-buffer)
     ;;     (goto-char (point-max))
     ;;     (insert "(user/reset)")
     ;;     (cider-repl-return)))
     ;;
     ;; (global-set-key (kbd "C-c C-l") cider-repl-reset)

     ;; Help with alignment
     (require 'align-cljlet)))
