(require 'boot.repl)

(swap! boot.repl/*default-dependencies*
       concat '[[cider/cider-nrepl "0.11.0-SNAPSHOT"]
                [refactor-nrepl "2.2.0-SNAPSHOT"]
                [acyclic/squiggly-clojure "0.1.5"]])

(swap! boot.repl/*default-middleware*
       conj
       ;;'cemerick.piggieback/wrap-cljs-repl
       'cider.nrepl/cider-middleware
       'refactor-nrepl.middleware/wrap-refactor)

(merge-env!
 :mirrors {#"clojars" {:name "clojars mirror"
                       :url "https://clojars-mirror.tcrawley.org/repo/"}})

(set-env! :dependencies '[[boot-deps "0.1.6"]])
(require '[boot-deps :refer [ancient]])

(set-env! :dependencies '[[criterium "0.4.3" :exclusions [org.clojure/clojure]]
                          [fipp "0.6.4"]])
