{:user {:deploy-repositories [["clojars" {:url "https://clojars.org/repo"
                                          :creds :gpg}]]
        :dependencies [[io.aviso/pretty "0.1.18"]
                       [fipp "0.6.2"]
                       [compliment "0.2.4"]
                       [table "0.5.0"]
                       [criterium "0.4.3"]
                       [cider/cider-nrepl "0.8.2" :exclusions [org.clojure/java.classpath]]]
        :plugins [[lein-typed "0.3.5"]
                  [lein-clojars "0.9.1"]
                  [lein-cljfmt "0.1.10"]
                  [venantius/yagni "0.1.2"]
                  [lein-collisions "0.1.1"]
                  [lein-kibit "0.1.2" :exclusions [org.clojure/clojure]]
                  [jonase/eastwood "0.2.1" :exclusions [org.clojure/clojure]]
                  [lein-bikeshed "0.2.0"]
                  [lein-ancient "0.6.7" :exclusions [org.clojure/tools.reader org.clojure/clojure]]
                  [lein-localrepo "0.5.3"]
                  [cider/cider-nrepl "0.8.2"]]
        :repl-options {:nrepl-middleware
                       [;;io.aviso.nrepl/pretty-middleware
                        cider.nrepl.middleware.apropos/wrap-apropos
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
