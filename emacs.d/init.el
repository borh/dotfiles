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
(require 'bind-key)                ;; if you use any :bind variant

;; Global to download and load all packages defined with use-package.
(setq use-package-always-ensure t)

;; Add in your own as you wish:
(defvar
  my-packages
  '(auto-complete exec-path-from-shell s
                  use-package
                  ;; clojure related
                  clojure-mode
                  rainbow-delimiters rainbow-mode rainbow-identifiers
                  align-cljlet cljsbuild-mode ;; clj-refactor ; <- fix yasnippet
                  latest-clojars flycheck-clojure
                  cider ac-cider
                  clj-refactor
                  ;; color themes
                  color-theme color-theme-sanityinc-tomorrow
                  color-theme-sanityinc-solarized
                  material-theme
                  ;; general interface improvements
                  projectile
                  telephone-line
                  ;;helm helm-themes ac-helm helm-projectile helm-R
                  ;;ido-ubiquitous smex ; needed by starter-kit
                  swiper counsel
                  company
                  adaptive-wrap
                  iy-go-to-char popup typopunct expand-region
                  smooth-scrolling tidy typing writegood-mode wc-mode wtf flyspell-lazy
                  save-visited-files thesaurus smart-tab smart-tabs-mode undo-tree
                  annoying-arrows-mode volatile-highlights browse-kill-ring
                  litable sublimity parscope pangu-spacing smartparens
                  diff-hl god-mode
                  dash dash-functional
                  color-identifiers-mode
                  langtool
                  hungry-delete
                  ;; language related
                  ess ess-R-data-view go-mode go-autocomplete js3-mode latex-pretty-symbols
                  ipython python python-mode python-pep8 ein jedi
                  ac-octave
                  cperl-mode dart-mode
                  coffee-mode less-css-mode scss-mode
                  yaml-mode haskell-mode
                  markdown-mode
                  markdown-mode+ pandoc-mode
                  puppet-mode
                  apache-mode
                  nginx-mode
                  ssh-config-mode
                  graphviz-dot-mode
                  omn-mode
                  dockerfile-mode
                  systemd
                  rust-mode flymake-rust flycheck-rust
                  nix-mode company-nixos-options
                  sql-indent format-sql
                  ;;ansible ;;-> yasnippets error
                  ;;nxml-mode
                  html5-schema
                  ;; flymake
                  flymake-coffee flymake-css flymake-sass flymake-jshint
                  flymake-sass
                  flymake-perlcritic
                  flymake-shell
                  flymake-go
                  pep8 flymake-python-pyflakes
                  flycheck
                  flycheck-status-emoji
                  flycheck-pos-tip
                  flyspell-lazy
                  ;; jabber
                  jabber
                  ;; git
                  magit
                  ;; org/latex
                  org
                  org-table-comment org-beautify-theme org-bullets
                  org-gcal org-mime ox-pandoc org-tracktable
                  ox-impress-js ox-reveal
                  org-dashboard org-multiple-keymap org-alert org-wc
                  cl-generic ;; needed for org-store-link to function for mu4e
                  htmlize
                  ac-math
                  ac-mozc
                  ;; yasnippet
                  ;;yasnippet
                  nterm
                  ;; other
                  mmm-mode
                  fountain-mode
                  )
  "A list of packages to ensure are installed at launch.")

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

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
