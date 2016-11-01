(set-env! :dependencies '[[boot-deps "0.1.6" :scope "test"]
                          [criterium "0.4.4" :exclusions [org.clojure/clojure] :scope "test"]
                          [fipp "0.6.6" :scope "test"]])

(require '[boot-deps :refer [ancient]])

(deftask cider "CIDER profile"
  []
  (require 'boot.repl)
  (swap! @(resolve 'boot.repl/*default-dependencies*)
         concat '[[org.clojure/tools.nrepl "0.2.12"]
                  [cider/cider-nrepl "0.15.0-SNAPSHOT"]
                  [refactor-nrepl "2.3.0-SNAPSHOT"]
                  #_[acyclic/squiggly-clojure "0.1.6"]])
  (swap! @(resolve 'boot.repl/*default-middleware*)
         concat '[cider.nrepl/cider-middleware
                  refactor-nrepl.middleware/wrap-refactor])
  identity)
