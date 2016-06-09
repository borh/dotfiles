{:user {:deploy-repositories [["clojars" {:url "https://clojars.org/repo"
                                          :creds :gpg}]]
        :mirrors {#"clojars" {:name "clojars mirror"
                              :url "https://clojars-mirror.tcrawley.org/repo/"}}
        :dependencies [[fipp "0.6.5"]
                       [table "0.5.0"]
                       [criterium "0.4.4"]
                       [acyclic/squiggly-clojure "0.1.5"]
                       [org.clojure/tools.nrepl "0.2.12"]
                       [cider/cider-nrepl "0.12.0"]]
        :plugins [[lein-typed "0.3.5"]
                  [lein-clojars "0.9.1"]
                  [lein-cljfmt "0.5.3"]
                  ;;[venantius/yagni "0.1.4" :exclusions [org.clojure/clojure org.clojure/tools.logging]]
                  [lein-collisions "0.1.4" :exclusions [org.clojure/clojure]]
                  [lein-kibit "0.1.2" :exclusions [org.clojure/clojure]]
                  [jonase/eastwood "0.2.3" :exclusions [org.clojure/clojure]]
                  [lein-bikeshed "0.3.0"]
                  [lein-ancient "0.6.10" :exclusions [org.clojure/clojure]]
                  [lein-localrepo "0.5.3"]
                  [refactor-nrepl "2.2.0"]
                  [cider/cider-nrepl "0.12.0"]]
        :repl-options {:nrepl-middleware
                       [cider.nrepl.middleware.apropos/wrap-apropos
                        cider.nrepl.middleware.classpath/wrap-classpath
                        cider.nrepl.middleware.complete/wrap-complete
                        cider.nrepl.middleware.info/wrap-info
                        cider.nrepl.middleware.inspect/wrap-inspect
                        cider.nrepl.middleware.macroexpand/wrap-macroexpand
                        cider.nrepl.middleware.ns/wrap-ns
                        cider.nrepl.middleware.resource/wrap-resource
                        cider.nrepl.middleware.stacktrace/wrap-stacktrace
                        cider.nrepl.middleware.test/wrap-test
                        cider.nrepl.middleware.trace/wrap-trace
                        cider.nrepl.middleware.undef/wrap-undef
                        cider.nrepl.middleware.classpath/wrap-classpath
                        cider.nrepl.middleware.complete/wrap-complete
                        cider.nrepl.middleware.info/wrap-info]}}}
