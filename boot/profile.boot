#_(merge-env!
 :mirrors {#"clojars" {:name "clojars mirror"
                       :url "https://clojars-mirror.tcrawley.org/repo/"}})

(set-env! :dependencies '[[boot-deps "0.1.6"]])
(require '[boot-deps :refer [ancient]])

(set-env! :dependencies '[[criterium "0.4.4" :exclusions [org.clojure/clojure]]
                          [fipp "0.6.4"]])

(deftask cider "CIDER profile"
  []
  (require 'boot.repl)
  (swap! @(resolve 'boot.repl/*default-dependencies*)
         concat '[[org.clojure/tools.nrepl "0.2.12"]
                  [cider/cider-nrepl "0.14.0-SNAPSHOT"]
                  [refactor-nrepl "2.3.0-SNAPSHOT"]
                  [acyclic/squiggly-clojure "0.1.6"]])
  (swap! @(resolve 'boot.repl/*default-middleware*)
         concat '[cider.nrepl/cider-middleware
                  refactor-nrepl.middleware/wrap-refactor])
  identity)
