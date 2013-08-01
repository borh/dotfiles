{:user {:deploy-repositories [["clojars" {:url "https://clojars.org/repo"
                                          :creds :gpg}]]
        :dependencies [[spyscope "0.1.3" :exclusions [clj-time]]
                       [print-foo "0.3.7"]
                       [fipp "0.4.0"]
                       [ritz/ritz-nrepl-middleware "0.7.0"]
                       [clojure-complete "0.2.3"]
                       [table "0.4.0"]
                       [slamhound "1.3.3"]
                       [nrepl-inspect "0.3.0"]]
        :aliases {"slamhound" ["run" "-m" "slam.hound"]}
        :injections [[(try (require 'spyscope.core)
                           (catch RuntimeException e))]]
        :plugins [[lein-difftest "2.0.0"]
                  [lein-clojars "0.9.1"]
                  [lein-marginalia "0.7.1"]
                  [lein-pprint "1.1.1"]
                  [lein-kibit "0.0.8" :exclusions [org.clojure/clojure]]
                  [lein-bikeshed "0.1.3"]
                  [lazytest "1.2.3"]
                  [lein-ancient "0.4.4"]
                  [lein-exec "0.3.0"]
                  [lein-bin "0.3.4"]
                  [org.clojars.strongh/lein-init-script "1.3.1"]
                  [lein-ritz "0.7.0"]]
        :repl-options {:custom-eval (require '[fipp.edn :refer (pprint) :rename {pprint fipp}])
                       :nrepl-middleware
                       [inspector.middleware/wrap-inspect
                        ritz.nrepl.middleware.javadoc/wrap-javadoc
                        ritz.nrepl.middleware.apropos/wrap-apropos]}}}
