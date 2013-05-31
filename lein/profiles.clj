{:user {:deploy-repositories [["clojars" {:url "https://clojars.org/repo"
                                          :creds :gpg}]]
        :dependencies [[spyscope "0.1.3" :exclusions [org.clojure/clojure]]
                       [print-foo "0.3.2" :exclusions [org.clojure/clojure]]
                       [fipp "0.3.0-SNAPSHOT"]
                       [ritz/ritz-nrepl-middleware "0.7.0"]
                       [clojure-complete "0.2.2"]
                       [table "0.4.0"]
                       [slamhound "1.3.3"]
                       [javert "0.2.0-SNAPSHOT"]]
        :aliases {"slamhound" ["run" "-m" "slam.hound"]}
        :injections [[(require 'spyscope.core)]
                     ;;[(use 'clojure.pprint)]
                     ;;[(use 'print.foo)]
                     ;;[(use '[bbloom.fipp.edn])]
                     ]
        :plugins [[lein-difftest "2.0.0"]
                  [lein-clojars "0.9.1"]
                  [lein-marginalia "0.7.1"]
                  [lein-pprint "1.1.1"]
                  [lein-swank "1.4.4"]
                  [lein-kibit "0.0.8" :exclusions [org.clojure/clojure]]
                  [lein-bikeshed "0.1.3"]
                  [lein-midje "3.0.1"]
                  [lein-midje-lazytest "0.1.0" :exclusions [org.clojure/clojure]]
                  [lazytest "1.2.3"]
                  [lein-expectations "0.0.8"]
                  [lein-autoexpect "0.2.5"]
                  [lein-outdated "1.0.0"]
                  [lein-exec "0.3.0"]
                  [lein-bin "0.3.2"]
                  [org.clojars.strongh/lein-init-script "1.3.1"]
                  [http-kit/lein-template "1.0.0-SNAPSHOT"]
                  [lein-ritz "0.7.0"]]
        :repl-options {:custom-eval (require '[bbloom.fipp.edn :refer (pprint) :rename {pprint fipp}])
                       :nrepl-middleware
                       [ritz.nrepl.middleware.javadoc/wrap-javadoc
                        ritz.nrepl.middleware.simple-complete/wrap-simple-complete
                        inspector.middleware/wrap-inspect]}}}
