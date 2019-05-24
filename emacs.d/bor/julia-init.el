(use-package julia-mode
  :config
  ;; (setq julia-program "/home/bor/Dependencies/julia/julia")
  (defun julia-completion-at-point ()
    (let ((bnds (bounds-of-thing-at-point 'symbol)))
      (when bnds
        (cond
         ;; complete latex symbol when current symbol is prefixed
         ;; by '\'
         ((eq (char-before (car bnds)) ?\\)
          (list (1- (car bnds)) (cdr bnds) julia-latexsubs
                :annotation-function
                #'(lambda (arg)
                    (gethash arg julia-latexsubs ""))))))))
  (add-hook 'completion-at-point-functions 'julia-completion-at-point nil t))
(use-package julia-repl
  :config
  (add-hook 'julia-mode-hook 'julia-repl-mode))
(use-package julia-shell)
