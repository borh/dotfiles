{:user {:deploy-repositories [["clojars" {:url "https://clojars.org/repo"
                                          :creds :gpg}]]
        :dependencies [[leiningen "2.3.4"]
                       [im.chit/vinyasa "0.1.8"]
                       [spyscope "0.1.4"]
                       [print-foo "0.4.7"]
                       [clj-stacktrace "0.2.7"]
                       [io.aviso/pretty "0.1.8"]
                       [com.aphyr/prism "0.1.2"]
                       [fipp "0.4.1"]
                       [ritz/ritz-nrepl-middleware "0.7.0"]
                       [clojure-complete "0.2.3"]
                       [compliment "0.0.3"]
                       [table "0.4.0"]
                       [com.ambrosebs/dynalint "0.1.3"]
                       [criterium "0.4.3"]
                       [slamhound "1.5.1"]
                       [nrepl-inspect "0.4.1"]]
        :aliases {"slamhound" ["run" "-m" "slam.hound"]}
        :injections [[#_(try (do (require 'vinyasa.inject)
                               (vinyasa.inject/inject 'clojure.core
                                                      '[[vinyasa.inject inject]
                                                        [vinyasa.pull pull]
                                                        [vinyasa.lein lein]
                                                        [vinyasa.reimport reimport]])
                               (vinyasa.inject/inject 'clojure.core '>
                                                      '[[cemerick.pomegranate add-classpath get-classpath resources]
                                                        [clojure.tools.namespace.repl refresh]
                                                        [clojure.repl apropos dir doc find-doc source pst
                                                         [root-cause >cause]]
                                                        [clojure.pprint pprint]
                                                        [clojure.java.shell sh]]))
                           (catch ClassNotFoundException e))
                      (try (use 'spyscope.core)
                           (catch RuntimeException e))
                      (try (use 'criterium.core)
                           (catch RuntimeException e))
                      (try (use 'clojure.pprint)
                           (catch RuntimeException e))
                      #_(do
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
                  [com.aphyr/prism "0.1.2"]
                  [lein-typed "0.3.2"]
                  [lein-clojars "0.9.1"]
                  [lein-marginalia "0.7.1"]
                  [lein-pprint "1.1.1"]
                  [lein-kibit "0.0.8" :exclusions [org.clojure/clojure]]
                  [jonase/eastwood "0.1.0"]
                  [lein-dynalint "0.1.4"]
                  [lein-bikeshed "0.1.6"]
                  [lazytest "1.2.3"]
                  [lein-ancient "0.5.4"]
                  [lein-datomic "0.2.0"]
                  [lein-exec "0.3.2"]
                  [lein-bin "0.3.4"]
                  [org.clojars.strongh/lein-init-script "1.3.1"]
                  [lein-ritz "0.7.0"]]
        :datomic {:install-location "../datomic-free-0.9.4556"}
        :repl-options {:nrepl-middleware
                       [inspector.middleware/wrap-inspect
                        ritz.nrepl.middleware.javadoc/wrap-javadoc
                        ritz.nrepl.middleware.apropos/wrap-apropos]}}}
