(if (display-graphic-p)
    (progn
      (scroll-bar-mode -1)
      (load-theme 'twilight-anti-bright t)
      (set-default-font "Envy Code R 13")))

(dolist (hook '(erc-mode-hook
        LaTeX-mode-hook
        edit-server-start-hook
        markdown-mode-hook))
  (add-hook hook (lambda () (variable-pitch-mode t))))

;; TODO check if this fixes slow font rendering
;;(setq jit-lock-defer-time 0.05)
(setq bidi-display-reordering nil)

;; Let's see what we're running on
(setq on-console (null window-system))

;; No splash screen
(setq inhibit-startup-message t)

;; Don't defer screen updates when performing operations
(setq redisplay-dont-pause t)

;; Standard Emacs functionality
(setq-default comint-prompt-read-only t)
(setq-default indent-tabs-mode nil)
(setq-default inhibit-startup-message t)
(setq-default next-line-add-newlines nil)
(setq-default require-final-newline nil)
(setq-default scroll-step 1)
; (menu-bar-mode nil) ; already in misc-recommended??
(tool-bar-mode nil)
(tool-bar-mode 0)
(column-number-mode)
(show-paren-mode)
(add-hook 'before-save-hook 'delete-trailing-whitespace)
(global-visual-line-mode 1) ; 1 for on, 0 for off.
(global-linum-mode 0) ; always show line numbers

(defface org-block-begin-line
  '((t (:underline "#003f8e" :foreground "#ffffff" :background "#002451")))
  "Face used for the line delimiting the begin of source blocks.")

(defface org-block-background
  '((t (:background "#002451")))
  "Face used for the source block background.")

(defface org-block-end-line
  '((t (:overline "#003f8e" :foreground "#ffffff" :background "#002451")))
  "Face used for the line delimiting the end of source blocks.")
