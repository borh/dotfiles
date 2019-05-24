(require 'cl)
(require 'package)
(add-to-list 'package-archives '("original"  . "http://tromey.com/elpa/") t)
(add-to-list 'package-archives '("gnu"       . "http://elpa.gnu.org/packages/") t)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives '("melpa"     . "http://melpa.org/packages/") t)
(add-to-list 'package-archives '("org"       . "http://orgmode.org/elpa/") t)
(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents))

(eval-when-compile
    (require 'use-package))
(require 'diminish)                ;; if you use :diminish
(require 'bind-key)                ;; if you use any :bind variant

(use-package gnu-elpa-keyring-update)

;; Global to download and load all packages defined with use-package.
(setq use-package-always-ensure t)

;; Fix emacs running under the fish shell
(require 's)
(when (s-ends-with? "fish" (getenv "SHELL"))
  (setq shell-file-name "/bin/bash" explicit-shell-file-name shell-file-name)
  (setenv "SHELL"  shell-file-name))

(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)
(put 'narrow-to-region 'disabled nil)

(blink-cursor-mode -1)

;; Set path to dependencies
(setq site-lisp-dir
      (expand-file-name "site-lisp" user-emacs-directory))

;; Set up load path
;;(add-to-list 'load-path user-emacs-directory)
(add-to-list 'load-path site-lisp-dir)
;; Settings for currently logged in user
(setq user-settings-dir
      (concat user-emacs-directory user-login-name))
(add-to-list 'load-path user-settings-dir)

;; Conclude init by setting up specifics for the current user
(when (file-exists-p user-settings-dir)
  (mapc 'load (directory-files user-settings-dir nil "^[^#].*el$")))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("f41ecd2c34a9347aeec0a187a87f9668fa8efb843b2606b6d5d92a653abe2439" default)))
 '(package-selected-packages
   (quote
    (yaml-mode wtf writegood-mode wc-mode volatile-highlights use-package undo-tree typopunct typing ttl-mode toml-mode tidy thesaurus telephone-line systemd sublimity ssh-config-mode sqlup-mode sql-indent sparql-mode solaire-mode smooth-scrolling smartparens smart-tabs-mode smart-tab smart-backspace slirm scss-mode save-visited-files sass-mode rainbow-mode rainbow-identifiers rainbow-delimiters python-pep8 python-mode puppet-mode pipenv pep8 parscope pangu-spacing pandoc-mode ox-twbs ox-reveal ox-pandoc ox-impress-js org-wc org-tracktable org-table-comment org-projectile-helm org-plus-contrib org-multiple-keymap org-msg org-fancy-priorities org-dashboard org-bullets org-beautify-theme org-autolist org-alert org-ac omn-mode olivetti nterm notmuch nginx-mode neotree n3-mode mu4e-conversation mu4e-alert moody mmm-mode material-theme markdown-mode+ magit litable linum-relative less-css-mode latex-pretty-symbols latest-clojars langtool klere-theme julia-shell julia-repl js3-mode jinja2-mode jedi jabber iy-go-to-char ipython interleave inf-clojure hungry-delete hugsql-ghosts html5-schema helm-rg helm-ls-git haskell-mode graphviz-dot-mode god-mode go-mode go-autocomplete geiser fountain-mode format-sql flyspell-lazy flymake-shell flymake-sass flymake-rust flymake-python-pyflakes flymake-perlcritic flymake-jshint flymake-go flymake-css flymake-coffee flycheck-status-emoji flycheck-rust flycheck-pos-tip flycheck-julia flycheck-clojure fish-mode fcitx expand-region exec-path-from-shell ess-R-data-view elpy ein doom-themes dockerfile-mode diff-hl datomic-snippets dash-functional dart-mode counsel company-math company-jedi company-auctex color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized color-theme color-identifiers-mode coffee-mode clojure-snippets clojure-mode-extra-font-locking cljsbuild-mode clj-refactor centered-window cargo browse-kill-ring apache-mode ansible-vault ansible annoying-arrows-mode align-cljlet aggressive-indent adaptive-wrap ac-octave ac-mozc ac-math ac-cider))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(fringe ((t (:background "#242730")))))
