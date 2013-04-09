;;(load-theme 'sanityinc-tomorrow-eighties t)
(load-theme 'sanityinc-tomorrow-day t)
;;(load-theme 'twilight-anti-bright t)
;;(load-theme 'subatomic t)
;;(load-theme 'sanityinc-solarized-light t)
;;(load-theme 'birds-of-paradise-plus t)

(custom-set-faces
 '(default ((t (:height 120 :weight normal :family "Ricty Discord"))))
 '(variable-pitch ((t (:height 135 :weight normal :family "Ricty Discord"))))
;; '(variable-pitch ((t (:height 130 :family "Segoe"))))
;; '(default ((t (:height 120 :family "Ricty Discord"))))
;; '(default ((t (:height 120 :weight normal :family "Ricty Discord"))))
;; '(variable-pitch ((t (:height 120 :weight light :family "Ricty Discord"))))
;; '(variable-pitch ((t (:height 120 :weight light :family "Source Sans Pro"))))
 )

(if (display-graphic-p)
    (progn
      (scroll-bar-mode nil)
      (set-fontset-font "fontset-default"
                        'unicode
                        (font-spec :family "Source Code Pro"
                                   :width 'normal
                                   :size 12.0
                                   :weight 'normal))
      (set-fontset-font (frame-parameter nil 'font)
                        'japanese-jisx0208
                        ;;'("Ricty Discord" . "unicode-bmp")
                        '("Hiragino Kaku Gothic Pro W3" . "unicode-bmp"))))

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
