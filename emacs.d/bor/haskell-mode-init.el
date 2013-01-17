(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)

;; ghc-mod setup
(autoload 'ghc-init "ghc" nil t)
(add-hook 'haskell-mode-hook (lambda () (ghc-init) (flymake-mode)))
