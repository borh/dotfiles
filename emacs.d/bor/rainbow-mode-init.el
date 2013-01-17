(dolist (mode '(lisp-mode-hook
                clojure-mode-hook
                clojurescript-mode-hook
                js2-mode-hook
                js3-mode-hook
                python-mode-hook
                less-css-mode
                css-mode
                html-mode
                nxml-mode))
  (add-hook 'rainbow-mode-hook
            (lambda () (rainbow-mode))))
