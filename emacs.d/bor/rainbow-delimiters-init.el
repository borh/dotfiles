;; (dolist (mode '(lisp-mode-hook
;;                 clojure-mode-hook
;;                 clojurescript-mode-hook
;;                 js2-mode-hook
;;                 js3-mode-hook
;;                 cider-repl-mode-hook
;;                 slime-mode-hook
;;                 python-mode-hook
;;                 markdown-mode
;;                 ess-mode))
;;   (add-hook 'rainbow-delimiters-hook
;;             (lambda () (rainbow-delimiters-mode))))

(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)
(add-hook 'text-mode-hook 'rainbow-delimiters-mode)
