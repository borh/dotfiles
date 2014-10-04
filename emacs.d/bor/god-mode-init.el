(defun c/god-mode-update-cursor ()
  (let ((limited-colors-p (> 257 (length (defined-colors)))))
    (cond (god-local-mode (progn
                            (set-face-background 'mode-line (if limited-colors-p "pink" "#ff5fff"))
                            (set-face-background 'mode-line-inactive (if limited-colors-p "pink" "#ff5fff"))))
          (t (progn
               (set-face-background 'mode-line (if limited-colors-p "black" "#0a2832"))
               (set-face-background 'mode-line-inactive (if limited-colors-p "black" "#0a2832")))))))

(eval-after-load "god-mode"
  '(progn
     (global-set-key (kbd "<escape>") 'god-local-mode)
     (define-key god-local-mode-map (kbd "z") 'repeat)
     (define-key god-local-mode-map (kbd "i") 'god-local-mode)
     (global-set-key (kbd "C-x C-1") 'delete-other-windows)
     (global-set-key (kbd "C-x C-2") 'split-window-below)
     (global-set-key (kbd "C-x C-3") 'split-window-right)
     (global-set-key (kbd "C-x C-0") 'delete-window)
     (add-to-list 'god-exempt-major-modes 'dired-mode)
     (add-hook 'god-mode-enabled-hook 'c/god-mode-update-cursor)
     (add-hook 'god-mode-disabled-hook 'c/god-mode-update-cursor)))
