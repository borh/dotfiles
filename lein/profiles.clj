{:user {:deploy-repositories [["clojars" {:url "https://clojars.org/repo"
                                          :creds :gpg}]]
        :dependencies [[spyscope "0.1.4"]
                       [print-foo "0.4.7"]
                       [clj-stacktrace "0.2.7"]
                       [io.aviso/pretty "0.1.8"]
                       [com.aphyr/prism "0.1.1"]
                       [fipp "0.4.1"]
                       [ritz/ritz-nrepl-middleware "0.7.0"]
                       [clojure-complete "0.2.3"]
                       [table "0.4.0"]
                       [criterium "0.4.2"]
                       [slamhound "1.5.0"]
                       [nrepl-inspect "0.4.1"]]
        :aliases {"slamhound" ["run" "-m" "slam.hound"]}
        :injections [[(try (use 'spyscope.core)
                           (catch RuntimeException e))
                      (try (use 'criterium.core)
                           (catch RuntimeException e))
                      (try (use 'clojure.pprint)
                           (catch RuntimeException e))
                      (do
                        (try (use 'io.aviso.exception)
                             (catch Exception e nil))
                        (defmacro e! [body]
                          `(try ~body
                                (catch Exception e# (io.aviso.exception/write-exception e#))))
                        (let [orig (ns-resolve (doto 'clojure.stacktrace require)
                                               'print-cause-trace)
                              new (ns-resolve (doto 'io.aviso.exception require)
                                              'write-exception)]
                          (alter-var-root orig (constantly (deref new)))))]]
        :plugins [[lein-difftest "2.0.0"]
                  [com.aphyr/prism "0.1.1"]
                  [lein-typed "0.3.1"]
                  [lein-clojars "0.9.1"]
                  [lein-marginalia "0.7.1"]
                  [lein-pprint "1.1.1"]
                  [lein-kibit "0.0.8" :exclusions [org.clojure/clojure]]
                  [jonase/eastwood "0.0.2"]
                  [lein-bikeshed "0.1.3"]
                  [lazytest "1.2.3"]
                  [lein-ancient "0.5.4"]
                  [lein-exec "0.3.1"]
                  [lein-bin "0.3.4"]
                  [org.clojars.strongh/lein-init-script "1.3.1"]
                  [lein-ritz "0.7.0"]]
        :repl-options {:custom-eval (require '[fipp.edn :refer (pprint) :rename {pprint fipp}])
                       :nrepl-middleware
                       [inspector.middleware/wrap-inspect
                        ritz.nrepl.middleware.javadoc/wrap-javadoc
                        ritz.nrepl.middleware.apropos/wrap-apropos]}}}
