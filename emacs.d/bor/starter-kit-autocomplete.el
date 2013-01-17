(require 'auto-complete)
(require 'auto-complete-config)
(ac-config-default)
(ac-flyspell-workaround)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
(global-auto-complete-mode t)
(setq ac-auto-show-menu t)
(setq ac-dwim t)
(setq ac-use-menu-map t)
(setq ac-quick-help-delay 1)
(setq ac-quick-help-height 60)

(set-default 'ac-sources
             '(ac-source-dictionary
               ac-source-words-in-buffer
               ac-source-words-in-same-mode-buffers
               ac-source-words-in-all-buffer))

(dolist (mode '(magit-log-edit-mode
                log-edit-mode
                org-mode
                text-mode
                sass-mode
                yaml-mode
                csv-mode
                espresso-mode
                haskell-mode
                html-mode
                nxml-mode
                sh-mode
                clojure-mode
                lisp-mode
                textile-mode
                markdown-mode
                slime-repl-mode))
  (add-to-list 'ac-modes mode))

(setq load-path (cons "~/.emacs.d/ac-slime" load-path))
(require 'ac-slime)
(add-hook 'slime-mode-hook 'set-up-slime-ac)

(define-globalized-minor-mode
  real-global-auto-complete-mode
  auto-complete-mode (lambda ()
                      (if (not (minibufferp (current-buffer)))
                          (auto-complete-mode 1))))
(real-global-auto-complete-mode t)
