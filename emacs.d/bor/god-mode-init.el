(eval-after-load "god-mode"
  '(progn
     (global-set-key (kbd "<escape>") 'god-local-mode)
     (define-key god-local-mode-map (kbd "z") 'repeat)
     (define-key god-local-mode-map (kbd "i") 'god-local-mode)
     (global-set-key (kbd "C-x C-1") 'delete-other-windows)
     (global-set-key (kbd "C-x C-2") 'split-window-below)
     (global-set-key (kbd "C-x C-3") 'split-window-right)
     (global-set-key (kbd "C-x C-0") 'delete-window)
     (add-to-list 'god-exempt-major-modes 'dired-mode)))
