(require 'cl)
(require 'package)
(add-to-list 'package-archives '("original"  . "http://tromey.com/elpa/") t)
(add-to-list 'package-archives '("gnu"       . "http://elpa.gnu.org/packages/") t)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives '("melpa"     . "http://melpa.milkbox.net/packages/") t)
(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents))

;; Add in your own as you wish:
(defvar
  my-packages
  '(auto-complete exec-path-from-shell s
    ;; clojure related
    clojure-mode
    rainbow-delimiters rainbow-mode rainbow-identifiers
    align-cljlet cljsbuild-mode ;; clj-refactor ; <- fix yasnippet
    latest-clojars flycheck-clojure
    cider ac-cider ac-cider-compliment
    clj-refactor
    ;; color themes
    color-theme color-theme-sanityinc-tomorrow
    color-theme-sanityinc-solarized
    twilight-bright-theme twilight-anti-bright-theme
    grandshell-theme noctilux-theme
    ;; theme-park-mode
    alect-themes ample-theme ample-zen-theme
    base16-theme calmer-forest-theme clues-theme
    cyberpunk-theme monokai-theme noctilux-theme
    ;; general interface improvements
    projectile
    ;;helm helm-themes ac-helm helm-projectile helm-R
    ;;ido-ubiquitous smex ; needed by starter-kit
    iy-go-to-char popup typopunct expand-region
    smooth-scrolling tidy typing writegood-mode wc-mode wtf flyspell-lazy
    save-visited-files thesaurus smart-tab smart-tabs-mode undo-tree
    annoying-arrows-mode volatile-highlights browse-kill-ring
    litable sublimity parscope pangu-spacing smartparens
    diff-hl god-mode
    dash dash-functional
    color-identifiers-mode
    langtool
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
    ssh-config-mode
    graphviz-dot-mode
    omn-mode
    dockerfile-mode
    rust-mode flymake-rust flycheck-rust
    ;;ansible ;;-> yasnippets error
    ;; nxml-mode
    ;; flymake
    flymake-coffee flymake-css flymake-sass flymake-jshint
    flymake-sass
    flymake-perlcritic
    flymake-shell
    flymake-go
    pep8 flymake-python-pyflakes
    flycheck
    flyspell-lazy
    ;; jabber
    jabber
    ;; git
    egg
    ;; org/latex
    org org-table-comment
    htmlize
    ac-math
    ;; yasnippet
    ;;yasnippet
    nterm
    ;; other
    mmm-mode
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
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector
   ["#14191f" "#d15120" "#81af34" "#deae3e" "#7e9fc9" "#a878b5" "#7e9fc9" "#dcdddd"])
 '(ansi-term-color-vector
   [unspecified "#14191f" "#d15120" "#81af34" "#deae3e" "#7e9fc9" "#a878b5" "#7e9fc9" "#dcdddd"])
 '(background-color "#202020")
 '(background-mode dark)
 '(cursor-color "#cccccc")
 '(custom-safe-themes
   (quote
    ("1cf3f29294c5a3509b7eb3ff9e96f8e8db9d2d08322620a04d862e40dc201fe2" "9ea054db5cdbd5baa4cda9d373a547435ba88d4e345f4b06f732edbc4f017dc3" "0c311fb22e6197daba9123f43da98f273d2bfaeeaeb653007ad1ee77f0003037" "30f861ee9dc270afc2a9962c05e02d600c998905433c8b9211dc2b33caa97c51" "06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" "628278136f88aa1a151bb2d6c8a86bf2b7631fbea5f0f76cba2a0079cd910f7d" "bb08c73af94ee74453c90422485b29e5643b73b05e8de029a6909af6a3fb3f58" "1b8d67b43ff1723960eb5e0cba512a2c7a2ad544ddb2533a90101fd1852b426e" "82d2cac368ccdec2fcc7573f24c3f79654b78bf133096f9b40c20d97ec1d8016" "4cf3221feff536e2b3385209e9b9dc4c2e0818a69a1cdb4b522756bcdf4e00a4" "4aee8551b53a43a883cb0b7f3255d6859d766b6c5e14bcb01bed572fcbef4328" "99cbc2aaa2b77374c2c06091494bd9d2ebfe6dc5f64c7ccdb36c083aff892f7d" "47583b577fb062aeb89d3c45689a4f2646b7ebcb02e6cb2d5f6e2790afb91a18" "5ce9c2d2ea2d789a7e8be2a095b8bc7db2e3b985f38c556439c358298827261c" "bb848b287a4e3162d63141cbacc64949e7dbeb41c944a0ba040785c285f5c9ba" "847c431bd5eb5017b601f4c599fb4b23b096e48739e4a708f57ac756358751f0" "9f42bccce1e13fa5017eb8718574db099e85358b9f424db78e7318f86d1be08f" "050beead9159996a613ba4bc734de8b13b882f1c6596d1dffa4f51d096662cf6" "7fa9dc3948765d7cf3d7a289e40039c2c64abf0fad5c616453b263b601532493" "73b835431bdbc4e83a3b176a38ebb740fbac78aa2635e1d4827b3c8211e0bc99" "2affb26fb9a1b9325f05f4233d08ccbba7ec6e0c99c64681895219f964aac7af" "5dfacaf380068d9ed06e0872a066a305ab6a1217f25c3457b640e76c98ae20e6" "e9c2f89affb1b03164e802769209acf38aa3129ccb7ad13badaf0d447a17df58" "7153b82e50b6f7452b4519097f880d968a6eaf6f6ef38cc45a144958e553fbc6" "a0feb1322de9e26a4d209d1cfa236deaf64662bb604fa513cca6a057ddf0ef64" default)))
 '(fci-rule-character-color "#192028")
 '(fci-rule-color "#192028")
 '(foreground-color "#cccccc")
 '(fringe-mode 10 nil (fringe))
 '(linum-format " %6d ")
 '(main-line-color1 "#222232")
 '(main-line-color2 "#333343")
 '(pdf-latex-command "lualatex")
 '(powerline-color1 "#222232")
 '(powerline-color2 "#333343")
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#cc6666")
     (40 . "#de935f")
     (60 . "#f0c674")
     (80 . "#b5bd68")
     (100 . "#8abeb7")
     (120 . "#81a2be")
     (140 . "#b294bb")
     (160 . "#cc6666")
     (180 . "#de935f")
     (200 . "#f0c674")
     (220 . "#b5bd68")
     (240 . "#8abeb7")
     (260 . "#81a2be")
     (280 . "#b294bb")
     (300 . "#cc6666")
     (320 . "#de935f")
     (340 . "#f0c674")
     (360 . "#b5bd68"))))
 '(vc-annotate-very-old-color nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
