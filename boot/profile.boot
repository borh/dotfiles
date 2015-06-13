(require 'boot.repl)

(swap! boot.repl/*default-dependencies*
       concat '[[cider/cider-nrepl "0.9.0-SNAPSHOT"]])

(swap! boot.repl/*default-middleware*
       conj 'cider.nrepl/cider-middleware)

(set-env! :dependencies '[[boot-deps "0.1.4"]])
(require '[boot-deps :refer [ancient]])

(set-env! :dependencies '[[criterium "0.4.3" :exclusions [org.clojure/clojure]]])
