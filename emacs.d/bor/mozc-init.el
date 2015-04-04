(require 'mozc)
(set-language-environment "Japanese")
(setq default-input-method "japanese-mozc")
;; need to test this; or maybe fall back to \C-z for whole system
;(global-set-key (kbd "<Zenkaku_Hankaku>") 'toggle-input-method)
;(global-set-key (kbd "<Menu>") 'toggle-input-method)
(global-set-key (kbd "C-z") 'toggle-input-method)

(eval-after-load "mozc"
  '(progn
     (require 'ac-mozc)
     (define-key ac-mode-map (kbd "C-c C-SPC") 'ac-complete-mozc)

     (defun my-ac-mozc-setup ()
       (setq ac-sources
	     '(ac-source-mozc ac-source-ascii-words-in-same-mode-buffers))
       (set (make-local-variable 'ac-auto-show-menu) 0.1))

     (add-hook 'markdown-mode-hook 'my-ac-mozc-setup)))
