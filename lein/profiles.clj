{:user {:deploy-repositories [["clojars" {:url "https://clojars.org/repo"
                                          :creds :gpg}]]
        :dependencies [[fipp "0.6.3"]
                       [table "0.5.0"]
                       [criterium "0.4.3"]
                       [acyclic/squiggly-clojure "0.1.4"]
                       [org.clojure/tools.nrepl "0.2.12"]
                       [cider/cider-nrepl "0.10.0-SNAPSHOT" :exclusions [org.clojure/java.classpath]]]
        :plugins [[lein-typed "0.3.5"]
                  [lein-clojars "0.9.1"]
                  [lein-cljfmt "0.3.0"]
                  [venantius/yagni "0.1.4" :exclusions [org.clojure/clojure org.clojure/tools.logging]]
                  [lein-collisions "0.1.4" :exclusions [org.clojure/clojure]]
                  [lein-kibit "0.1.2" :exclusions [org.clojure/clojure]]
                  [jonase/eastwood "0.2.2" :exclusions [org.clojure/clojure]]
                  [lein-bikeshed "0.2.0"]
                  [lein-ancient "0.6.8" :exclusions [org.clojure/tools.reader org.clojure/clojure]]
                  [lein-localrepo "0.5.3"]
                  [refactor-nrepl "2.0.0-SNAPSHOT" :exclusions [org.clojure/tools.reader]]
                  [cider/cider-nrepl "0.10.0-SNAPSHOT"]]
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
