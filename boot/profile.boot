(require 'boot.repl)

(swap! boot.repl/*default-dependencies*
       concat '[[cider/cider-nrepl "0.10.0-SNAPSHOT"]
                [refactor-nrepl "2.0.0-SNAPSHOT"]])

(swap! boot.repl/*default-middleware*
       conj
       'cider.nrepl/cider-middleware
       'refactor-nrepl.middleware/wrap-refactor)

(set-env! :dependencies '[[boot-deps "0.1.6"]])
(require '[boot-deps :refer [ancient]])

(set-env! :dependencies '[[criterium "0.4.3" :exclusions [org.clojure/clojure]]
                          [fipp "0.6.2"]])
