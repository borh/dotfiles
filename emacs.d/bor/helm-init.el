(require 'helm-config)
(helm-mode 1)

(require 'ac-helm)
(define-key ac-complete-mode-map (kbd "C-:") 'ac-complete-with-helm)
