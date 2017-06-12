;; Load color scheme in console and GUI modes
;; (load-theme 'sanityinc-tomorrow-night t) ;; <- For console use.
(use-package
  doom-themes
  :config
  (load-theme 'doom-vibrant t)
  (doom-themes-visual-bell-config))

(use-package
  solaire-mode
  :config
  ;; (add-hook 'after-change-major-mode-hook #'turn-on-solaire-mode)
  (add-hook 'after-revert-hook #'turn-on-solaire-mode)
  (add-hook 'ediff-prepare-buffer-hook #'solaire-mode)
  (add-hook 'minibuffer-setup-hook #'solaire-mode-in-minibuffer)
  )

(use-package
  all-the-icons
  ;; Run M-x all-the-icons-install-fonts
  )

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

      (make-cjk-fontset "fixed" "Fira Code" "Hiragino Kaku Gothic Pro" 14 0.8)
      (make-cjk-fontset "variable" "Equity Text B" "Hiragino Mincho Pro W3" 14 0.7)

      ;; ;; https://gist.github.com/yoshinari-nomura/3465571
      ;; ;; フォントセットを作る
      ;; (let* ((fontset-name "myfonts") ; フォントセットの名前
      ;;        (size 14) ; ASCIIフォントのサイズ [9/10/12/14/15/17/19/20/...]
      ;;
      ;;        ;; ASCIIフォント
      ;;        ;;(asciifont "Ricty Discord")
      ;;        ;;(asciifont "Fantasque Sans Mono")
      ;;        (asciifont "Fira Code")
      ;;        (asciifont-proportional "Equity Text B")
      ;;
      ;;        ;; 日本語フォント
      ;;        (jpfont "Hiragino Kaku Gothic Pro")
      ;;        (jpfont-proportional "Hiragino Mincho Pro W3")
      ;;        ;;(jpfont "Ricty Discord")
      ;;
      ;;        (font (format "%s-%d:weight=normal:slant=normal" asciifont size))
      ;;        (font-proportional (format "%s-%d:weight=normal:slant=normal" asciifont size))
      ;;        (fontspec (font-spec :family asciifont))
      ;;        (jp-fontspec (font-spec :family jpfont))
      ;;        (fsn (create-fontset-from-ascii-font font nil fontset-name)))
      ;;   (set-fontset-font fsn 'japanese-jisx0213.2004-1 jp-fontspec)
      ;;   (set-fontset-font fsn 'japanese-jisx0213-2 jp-fontspec)
      ;;   (set-fontset-font fsn 'katakana-jisx0201 jp-fontspec) ; 半角カナ
      ;;   (set-fontset-font fsn '(#x0080 . #x024F) fontspec) ; 分音符付きラテン
      ;;   (set-fontset-font fsn '(#x0370 . #x03FF) fontspec) ; ギリシャ文字
      ;;   )

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
