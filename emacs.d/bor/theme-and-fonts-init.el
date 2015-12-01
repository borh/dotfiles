(if (display-graphic-p)
    (progn
      (scroll-bar-mode -1)
      (load-theme 'sanityinc-tomorrow-night t)
      ;;(load-theme 'material t)
      ;;(setq show-paren-style 'expression)
      ;;(set-default-font "Envy Code R 13")
      ;;(set-default-font "Ricty 15")
      ;;(set-default-font "Source Code Pro Light 13")
      ;; https://gist.github.com/yoshinari-nomura/3465571
      ;; フォントセットを作る
      (let* ((fontset-name "myfonts") ; フォントセットの名前
             (size 18) ; ASCIIフォントのサイズ [9/10/12/14/15/17/19/20/...]

             ;; ASCIIフォント
             ;;(asciifont "Ricty Discord")
             (asciifont "Fantasque Sans Mono")

             ;; 日本語フォント
             ;;(jpfont "Hiragino Kaku Gothic Pro")
             ;;(jpfont "Hiragino Mincho Pro W3")
             (jpfont "Ricty Discord")

             (font (format "%s-%d:weight=normal:slant=normal" asciifont size))
             (fontspec (font-spec :family asciifont))
             (jp-fontspec (font-spec :family jpfont))
             (fsn (create-fontset-from-ascii-font font nil fontset-name)))
        (set-fontset-font fsn 'japanese-jisx0213.2004-1 jp-fontspec)
        (set-fontset-font fsn 'japanese-jisx0213-2 jp-fontspec)
        (set-fontset-font fsn 'katakana-jisx0201 jp-fontspec) ; 半角カナ
        (set-fontset-font fsn '(#x0080 . #x024F) fontspec) ; 分音符付きラテン
        (set-fontset-font fsn '(#x0370 . #x03FF) fontspec) ; ギリシャ文字
        )

      ;; デフォルトのフレームパラメータでフォントセットを指定
      (add-to-list 'default-frame-alist '(font . "fontset-myfonts"))

      ;; Disable when using Ricty Discord:
      ;; ;; フォントサイズの比を設定
      ;; (dolist (elt '(("^-apple-hiragino.*" . 1.2)
      ;;                (".*source-code.*" . 0.9)))
      ;;   (add-to-list 'face-font-rescale-alist elt))

      ;; デフォルトフェイスにフォントセットを設定
      ;; # これは起動時に default-frame-alist に従ったフレームが
      ;; # 作成されない現象への対処
      (set-face-font 'default "fontset-myfonts")

      (setq locale-coding-system 'utf-8)
      (set-terminal-coding-system 'utf-8)
      (set-buffer-file-coding-system 'utf-8)
      (set-keyboard-coding-system 'utf-8)
      (set-selection-coding-system 'utf-8)
      (prefer-coding-system 'utf-8)))

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
