(require 'starter-kit-defuns)

(dolist (hook '(clojure-mode-hook
                nrepl-mode-hook
                lisp-mode
                javascript-mode))
  (add-hook hook
            '(lambda () (rainbow-delimiters-mode t)
               (paredit-mode t))))

(add-hook 'nrepl-interaction-mode-hook
          'nrepl-turn-on-eldoc-mode)

;;(add-hook 'clojure-mode-hook (lambda () (rainbow-delimiters-mode t) (paredit-mode t)))
;(add-hook 'paredit-mode-hook)

(setq nrepl-popup-stacktraces 1)

(add-to-list 'same-window-buffer-names "*nrepl*")

(add-hook 'nrepl-mode-hook 'subword-mode)

(setq nrepl-hide-special-buffers t)

(setq nrepl-popup-stacktraces-in-repl t)

;(add-hook 'nrepl-mode-hook 'comint-truncate-buffer)
;(setq comint-buffer-maximum-size 2000)

(require 'ac-nrepl)
(add-hook 'nrepl-mode-hook 'ac-nrepl-setup)
(add-hook 'nrepl-interaction-mode-hook 'ac-nrepl-setup)
(eval-after-load "auto-complete"
  '(add-to-list 'ac-modes 'nrepl-mode))

(defun set-auto-complete-as-completion-at-point-function ()
  (setq completion-at-point-functions '(auto-complete)))
(add-hook 'auto-complete-mode-hook 'set-auto-complete-as-completion-at-point-function)

(add-hook 'nrepl-mode-hook 'set-auto-complete-as-completion-at-point-function)
(add-hook 'nrepl-interaction-mode-hook 'set-auto-complete-as-completion-at-point-function)

;; Help with alignment
(require 'align-cljlet)


;; highlight expression on eval ; not working???
;(require 'highlight)
;(require 'nrepl-eval-sexp-fu)
;(setq nrepl-eval-sexp-fu-flash-duration 0.5)
