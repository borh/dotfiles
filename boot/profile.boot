(require 'boot.repl)

(swap! boot.repl/*default-dependencies*
       concat '[[cider/cider-nrepl "0.9.1"]
                [refactor-nrepl "1.1.0-SNAPSHOT"]])

(swap! boot.repl/*default-middleware*
       conj
       'cider.nrepl/cider-middleware
       'refactor-nrepl.middleware/wrap-refactor)

(set-env! :dependencies '[[boot-deps "0.1.4"]])
(require '[boot-deps :refer [ancient]])

(set-env! :dependencies '[[criterium "0.4.3" :exclusions [org.clojure/clojure]]])
