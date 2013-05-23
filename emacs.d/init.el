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
  '(starter-kit starter-kit-lisp starter-kit-bindings starter-kit-js starter-kit-perl
    auto-complete exec-path-from-shell
    ;; clojure related
    clojure-mode clojurescript-mode paredit rainbow-delimiters rainbow-mode
    clojure-test-mode align-cljlet cljsbuild-mode clj-refactor latest-clojars
    slamhound
    nrepl nrepl-ritz midje-mode
    ac-nrepl ac-slime
    ;; color themes
    color-theme color-theme-sanityinc-tomorrow
    color-theme-sanityinc-solarized
    twilight-bright-theme twilight-anti-bright-theme
    grandshell-theme noctilux-theme
    theme-park-mode
    ;; general interface improvements
    projectile
    helm helm-themes ac-helm helm-projectile helm-R
    ido-ubiquitous smex ; needed by starter-kit
    iy-go-to-char popup typopunct expand-region
    smooth-scrolling tidy typing writegood-mode wc-mode wtf flyspell-lazy
    save-visited-files thesaurus smart-tab smart-tabs-mode undo-tree
    annoying-arrows-mode volatile-highlights browse-kill-ring
    litable sublimity paredit-everywhere pangu-spacing
    diff-hl
    ;; language related
    ess ess-R-data-view go-mode go-autocomplete js2-mode ac-js2 js3-mode latex-pretty-symbols
    ipython python python-mode python-pep8 ein jedi
    cperl-mode dart-mode
    coffee-mode less-css-mode scss-mode
    yaml-mode haskell-mode
    markdown-mode
    markdown-mode+ pandoc-mode
    puppet-mode
    apache-mode
    ssh-config-mode
    nxml-mode
    ;; flymake
    flymake-coffee flymake-css flymake-sass flymake-jshint
    flymake-perlcritic
    flymake-shell
    flymake-go
    pep8 flymake-python-pyflakes
    flycheck
    ;; jabber
    jabber
    ;; git
    magit
    ;; org/latex
    org org-table-comment
    htmlize
    ac-math
    ;; yasnippet
    yasnippet-bundle yasnippet
    tomatinho
    nterm
    )
  "A list of packages to ensure are installed at launch.")

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector ["#FFFFFF" "#d15120" "#5f9411" "#d2ad00" "#6b82a7" "#a66bab" "#6b82a7" "#505050"])
 '(ansi-term-color-vector [unspecified "#FFFFFF" "#d15120" "#5f9411" "#d2ad00" "#6b82a7" "#a66bab" "#6b82a7" "#505050"])
 '(background-color "#202020")
 '(background-mode dark)
 '(cursor-color "#cccccc")
 '(custom-safe-themes (quote ("4dacec7215677e4a258e4529fac06e0231f7cdd54e981d013d0d0ae0af63b0c8" "d1a574d57027c2bfadde6982455dfce8d27ced3ae4747c1c0313f95d23e96713" "4ddc42a539280ec21ae202b6c12a4d7ce7d7af8a19e8c344b60b09f1ca1496d5" "d5b63a5da8bf90c7347e5e484dcde0380af010ec130f6f0d132113d807e49e03" "ff7a12f1932abcdc754511b5c5c6416e769d7f1a44e64690e2c98433b18bd67e" "38c4fb6c8b2625f6307f3dde763d5c61d774d854ecee9c5eb9c5433350bc0bef" "5f7044d9fc9c9c9d56508ac8217483c8358a191599448859640ce80be92acbd6" "1f31a5f247d0524ef9c051d45f72bae6045b4187ed7578a7b1f8cb8758f92b60" "75d4ccc5e912b93f722e57cca3ca1a15e079032cd69fd9bc67268b4c85639663" "50ceca952b37826e860867d939f879921fac3f2032d8767d646dd4139564c68a" "e16a771a13a202ee6e276d06098bc77f008b73bbac4d526f160faa2d76c1dd0e" "628278136f88aa1a151bb2d6c8a86bf2b7631fbea5f0f76cba2a0079cd910f7d" "88d556f828e4ec17ac074077ef9dcaa36a59dccbaa6f2de553d6528b4df79cbd" "ce0b97888d66d8183309eaa66f1f4f998627daed381d10a2fd5e8e778f302a8e" "281e88e0dfab4980a157331b368fb2e5eba315c38f38099d2d9153980a8047ba" "2e3d0f112e5534bae9c0f64760d7d65380add64cafc1a6b6f8bd971e7dc95a50" "52280e346b1cd6503b2fc7c9f666eeef9a68fc4854598639478d64a6c98c7ecf" "9448a3998a7eae068ac10c9f249bd032d5c36661070d1f565a23b10f422fa2fe" "64b7be5703b90e05f7bc1f63a9f689a7c931626462697bea9476b397da194bd9" "e85dd0d1b43cc1d725db627298c2753b0c3e90dc0b195e80f09f97a4e1e5660c" "944f3086f68cc5ea9dfbdc9e5846ad91667af9472b3d0e1e35a9633dcab984d5" "c56fd34f8f404e6e9e6f226c6ce2d170595acc001741644d22b49e457e3cd497" "8281168b824a806489ca7d22e60bb15020bf6eecd64c25088c85b3fd806fc341" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "4cf3221feff536e2b3385209e9b9dc4c2e0818a69a1cdb4b522756bcdf4e00a4" "1b8d67b43ff1723960eb5e0cba512a2c7a2ad544ddb2533a90101fd1852b426e" "bf7ed640479049f1d74319ed004a9821072c1d9331bc1147e01d22748c18ebdf" "5e1d1564b6a2435a2054aa345e81c89539a72c4cad8536cfe02583e0b7d5e2fa" "6cfe5b2f818c7b52723f3e121d1157cf9d95ed8923dbc1b47f392da80ef7495d" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "211bb9b24001d066a646809727efb9c9a2665c270c753aa125bace5e899cb523" "6615e5aefae7d222a0c252c81aac52c4efb2218d35dfbb93c023c4b94d3fa0db" "27b53b2085c977a8919f25a3a76e013ef443362d887d52eaa7121e6f92434972" "967c58175840fcea30b56f2a5a326b232d4939393bed59339d21e46cf4798ecf" "6bc195f4f8f9cf1a4b1946a12e33de2b156ce44e384fbc54f1bae5b81e3f5496" "bb08c73af94ee74453c90422485b29e5643b73b05e8de029a6909af6a3fb3f58" "fca8ce385e5424064320d2790297f735ecfde494674193b061b9ac371526d059" "159bb8f86836ea30261ece64ac695dc490e871d57107016c09f286146f0dae64" "06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" "82d2cac368ccdec2fcc7573f24c3f79654b78bf133096f9b40c20d97ec1d8016" "4aee8551b53a43a883cb0b7f3255d6859d766b6c5e14bcb01bed572fcbef4328" default)))
 '(ebib-preload-bib-search-dirs (quote ("/work/projects/github/borh/bibliography/")))
 '(fci-rule-character-color "#d9d9d9")
 '(fci-rule-color "#d9d9d9")
 '(foreground-color "#cccccc")
 '(highlight-changes-colors (quote ("#d33682" "#6c71c4")))
 '(highlight-tail-colors (quote (("#eee8d5" . 0) ("#B4C342" . 20) ("#69CABF" . 30) ("#69B7F0" . 50) ("#DEB542" . 60) ("#F2804F" . 70) ("#F771AC" . 85) ("#eee8d5" . 100))))
 '(safe-local-variable-values (quote ((whitespace-style face tabs spaces trailing lines space-before-tab::space newline indentation::space empty space-after-tab::space space-mark tab-mark newline-mark) (whitespace-line-column . 100) (lexical-binding . t))))
 '(vc-annotate-background "#d4d4d4")
 '(vc-annotate-color-map (quote ((20 . "#437c7c") (40 . "#336c6c") (60 . "#205070") (80 . "#2f4070") (100 . "#1f3060") (120 . "#0f2050") (140 . "#a080a0") (160 . "#806080") (180 . "#704d70") (200 . "#603a60") (220 . "#502750") (240 . "#401440") (260 . "#6c1f1c") (280 . "#935f5c") (300 . "#834744") (320 . "#732f2c") (340 . "#6b400c") (360 . "#23733c"))))
 '(vc-annotate-very-old-color "#23733c"))

;;(scroll-bar-mode -1)

;; if on Gentoo
;(require 'site-gentoo)

(put 'upcase-region 'disabled nil)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
