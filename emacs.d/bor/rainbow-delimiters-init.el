(dolist (mode '(lisp-mode-hook
                clojure-mode-hook
                clojurescript-mode-hook
                js2-mode-hook
                js3-mode-hook
                nrepl-mode-hook
                slime-mode-hook
                python-mode-hook))
  (add-hook 'rainbow-delimiters-hook
            (lambda () (rainbow-delimiters-mode))))
