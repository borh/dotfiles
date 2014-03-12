(eval-after-load "cider-mode"
  '(progn
     (dolist
         (hook '(clojure-mode-hook
                 cider-nrepl-mode-hook
                 lisp-mode
                 javascript-mode))
       (add-hook hook
                 '(lambda ()
                    (cider-mode t)
                    (auto-complete-mode t)
                    (rainbow-delimiters-mode t)
                    (smartparens-strict-mode t))))

     (add-hook 'cider-repl-mode-hook 'smartparens-strict-mode)
     (add-hook 'cider-interaction-mode-hook
               'cider-turn-on-eldoc-mode)

     (add-hook 'cider-repl-mode-hook 'subword-mode)
     ;;(setq cider-hide-special-buffers t)
     (setq cider-popup-stacktraces t)
     (setq cider-popup-stacktraces-in-repl t)
     (setq cider-auto-select-error-buffer t)
     (eval-after-load "auto-complete"
       '(add-to-list 'ac-modes 'clojure-mode))

     (require 'ac-nrepl)
     (add-hook 'cider-repl-mode-hook 'ac-nrepl-setup)
     (add-hook 'cider-mode-hook 'ac-nrepl-setup)
     (eval-after-load "auto-complete"
       '(add-to-list 'ac-modes 'cider-repl-mode))

     (require 'auto-complete)

     (require 'ac-cider-compliment)
     (add-hook 'cider-mode-hook 'ac-cider-compliment-setup)
     (add-hook 'cider-mode-hook 'ac-flyspell-workaround)
     (eval-after-load "auto-complete"
       '(add-to-list 'ac-modes cider-mode))
     (defun set-auto-complete-as-completion-at-point-function ()
       (setq completion-at-point-functions '(auto-complete)))
     (add-hook 'auto-complete-mode-hook 'set-auto-complete-as-completion-at-point-function)
     (add-hook 'cider-mode-hook 'set-auto-complete-as-completion-at-point-function)

     (add-hook 'cider-repl-mode-hook 'set-auto-complete-as-completion-at-point-function)
     (add-hook 'cider-mode-hook 'set-auto-complete-as-completion-at-point-function)
     (add-hook 'cider-interaction-mode-hook 'set-auto-complete-as-completion-at-point-function)
     (define-key cider-mode-map (kbd "C-c C-d") 'ac-nrepl-popup-doc)

     ;; Help with alignment
     (require 'align-cljlet)

     ;; (defun repl-reset ()
     ;;   (interactive)
     ;;   (save-some-buffers)
     ;;   (with-current-buffer (cider-current-repl-buffer)
     ;;     (goto-char (point-max))
     ;;     (insert "(user/reset)")
     ;;     (cider-repl-return)))
     ;;
     ;; (global-set-key (kbd "C-c C-l") cider-repl-reset)
     ))
