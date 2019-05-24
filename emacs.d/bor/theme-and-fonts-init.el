(use-package
  doom-themes
  :config
  (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
        doom-themes-enable-italic t) ; if nil, italics is universally disabled
  (load-theme 'doom-one t)
  (doom-themes-visual-bell-config)
  (doom-themes-org-config)
  (doom-themes-neotree-config))

(use-package doom-modeline
  :ensure t
  :hook (after-init . doom-modeline-mode)
  :config
  (setq doom-modeline-height 25))

(use-package ;; Run M-x all-the-icons-install-fonts
  all-the-icons)

;; TODO/FIXME need a way to apply this for emacsclient
;; Below is example hook that should be able to do this:
;; (add-hook 'after-make-frame-functions (lambda (frame) (set-fontset-font t '(#Xe100 . #Xe16f) "Fira Code Symbol")))

(setq locale-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

(defun make-cjk-fontset (font-name western-font-name eastern-font-name font-size scale-factor)
  "Make a new font combined from WESTERN-FONT-NAME (ascii) and EASTERN-FONT-NAME (Japanese/CJK) font of given FONT-SIZE.  SCALE-FACTOR is the size scale between the fonts, typically making the eastern one smaller."
  (let* ((font (format "%s-%d:weight=normal:slant=normal" western-font-name font-size))
         (fontspec (font-spec :family western-font-name))
         (jp-fontspec (font-spec :family eastern-font-name))
         (fsn (create-fontset-from-ascii-font font nil font-name)))
    (set-fontset-font fsn 'japanese-jisx0213.2004-1 jp-fontspec)
    (set-fontset-font fsn 'japanese-jisx0213-2 jp-fontspec)
    (set-fontset-font fsn 'katakana-jisx0201 jp-fontspec)
    (set-fontset-font fsn '(#x0080 . #x024F) fontspec)
    (set-fontset-font fsn '(#x0370 . #x03FF) fontspec)
    (set-fontset-font fsn '(#xe100 . #xe16f) "Iosevka")

    (dolist (elt '(((concat
                     ".*"
                     (downcase
                      (replace-regexp-in-string " " "-" eastern-font-name nil t))
                     ".*") . scale-factor)
                   ((concat
                     ".*"
                     (downcase
                      (replace-regexp-in-string " " "-" western-font-name nil t))
                     ".*") . 1.0)))
      (add-to-list 'face-font-rescale-alist elt))
    fsn))

(if (display-graphic-p)
    (progn
      (scroll-bar-mode -1)

      ;; (make-cjk-fontset "fixed" "Fira Code" "Hiragino Kaku Gothic Pro" 12 0.8)
      (make-cjk-fontset "fixed" "Sarasa Mono T J" "Iosevka" 11 1.0)
      ;; (make-cjk-fontset "fixed" "Fira Code" "Sarasa Mono T J" 11 1.0)
      ;; (make-cjk-fontset "fixed" "Inziu Iosevka J" "Inziu Iosevka J" 12 1.0)
      (make-cjk-fontset "variable" "Equity Text B" "Sarasa UI J" 11 1.0)

      ;; デフォルトのフレームパラメータでフォントセットを指定
      (add-to-list 'default-frame-alist '(font . "fontset-fixed"))
      (set-face-font 'default "fontset-fixed")
      (set-face-font 'variable-pitch "fontset-variable"))
  ;; Fixes colors in terminal under some environments.
  (tty-run-terminal-initialization (selected-frame) "xterm"))

(dolist (hook '(erc-mode-hook
                LaTeX-mode-hook
                edit-server-start-hook
                markdown-mode-hook
                org-mode-hook))
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
(tool-bar-mode nil)
(tool-bar-mode 0)
(column-number-mode)
(show-paren-mode)
(add-hook 'before-save-hook 'delete-trailing-whitespace)
(add-hook 'visual-line-mode-hook
          (lambda ()
            (adaptive-wrap-prefix-mode +1)))
(global-visual-line-mode 1) ; 1 for on, 0 for off.
(global-linum-mode 0) ; never show line numbers

(defface org-block-begin-line
  '((t (:underline "#003f8e" :foreground "#ffffff" :background "#002451")))
  "Face used for the line delimiting the begin of source blocks.")

(defface org-block-background
  '((t (:background "#002451")))
  "Face used for the source block background.")

(defface org-block-end-line
  '((t (:overline "#003f8e" :foreground "#ffffff" :background "#002451")))
  "Face used for the line delimiting the end of source blocks.")

;; (use-package centered-window :ensure t
;;   :config (centered-window-mode t))

(require 'ligatures-init)

;; (require 'fira-code-mode)
