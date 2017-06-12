{:user {:deploy-repositories [["clojars" {:url "https://clojars.org/repo"
                                          :creds :gpg}]]
        #_:mirrors #_{#"clojars" {:name "clojars mirror"
                                  :url "https://clojars-mirror.tcrawley.org/repo/"}}
        :dependencies [[org.clojure/tools.nrepl "0.2.12"]
                       [cider/cider-nrepl "0.14.0"]]
        :repl-options {:nrepl-middleware
                       [cider.nrepl.middleware.apropos/wrap-apropos
                        cider.nrepl.middleware.classpath/wrap-classpath
                        cider.nrepl.middleware.complete/wrap-complete
                        cider.nrepl.middleware.debug/wrap-debug
                        cider.nrepl.middleware.format/wrap-format
                        cider.nrepl.middleware.info/wrap-info
                        cider.nrepl.middleware.inspect/wrap-inspect
                        cider.nrepl.middleware.macroexpand/wrap-macroexpand
                        cider.nrepl.middleware.ns/wrap-ns
                        cider.nrepl.middleware.pprint/wrap-pprint
                        cider.nrepl.middleware.pprint/wrap-pprint-fn
                        cider.nrepl.middleware.refresh/wrap-refresh
                        cider.nrepl.middleware.resource/wrap-resource
                        cider.nrepl.middleware.stacktrace/wrap-stacktrace
                        cider.nrepl.middleware.test/wrap-test
                        cider.nrepl.middleware.trace/wrap-trace
                        cider.nrepl.middleware.out/wrap-out
                        cider.nrepl.middleware.undef/wrap-undef
                        cider.nrepl.middleware.version/wrap-version]}}}
