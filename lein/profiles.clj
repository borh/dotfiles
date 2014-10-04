{:user {:deploy-repositories [["clojars" {:url "https://clojars.org/repo"
                                          :creds :gpg}]]
        :dependencies [[leiningen "2.5.0" :exclusions [org.codehaus.plexus/plexus-utils org.clojure/tools.macro com.fasterxml.jackson.core/jackson-core]]
                       ;;[im.chit/vinyasa "0.2.0"]
                       [spyscope "0.1.4"]
                       [io.aviso/pretty "0.1.12"]
                       [com.aphyr/prism "0.1.2"]
                       [fipp "0.4.3"]
                       [compliment "0.1.4"]
                       [table "0.4.0"]
                       [com.ambrosebs/dynalint "0.1.3"]
                       [criterium "0.4.3"]
                       [slamhound "1.5.5"]
                       [cider/cider-nrepl "0.8.0-SNAPSHOT"]]
        :aliases {"slamhound" ["run" "-m" "slam.hound"]}
        :plugins [[lein-difftest "2.0.0"]
                  [com.aphyr/prism "0.1.2"]
                  [lein-typed "0.3.5"]
                  [lein-clojars "0.9.1"]
                  [lein-marginalia "0.8.0"]
                  [lein-pprint "1.1.2"]
                  [lein-kibit "0.0.8" :exclusions [org.clojure/clojure]]
                  [jonase/eastwood "0.1.4" :exclusions [org.clojure/clojure]]
                  [lein-dynalint "0.1.4"]
                  [lein-bikeshed "0.1.8"]
                  [lazytest "1.2.3"]
                  [lein-ancient "0.5.5"]
                  [lein-datomic "0.2.0"]
                  [lein-exec "0.3.4"]
                  [lein-bin "0.3.4"]
                  [lein-localrepo "0.5.3"]
                  [org.clojars.strongh/lein-init-script "1.3.1"]
                  [cider/cider-nrepl "0.8.0-SNAPSHOT"]]
        :datomic {:install-location "../datomic-free-0.9.4556"}
        :repl-options {:nrepl-middleware
                       [;;io.aviso.nrepl/pretty-middleware
                        cider.nrepl.middleware.classpath/wrap-classpath
                        cider.nrepl.middleware.complete/wrap-complete
                        cider.nrepl.middleware.info/wrap-info
                        cider.nrepl.middleware.inspect/wrap-inspect
                        cider.nrepl.middleware.stacktrace/wrap-stacktrace
                        cider.nrepl.middleware.trace/wrap-trace]}}}
