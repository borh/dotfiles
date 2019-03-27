{:user {:deploy-repositories [["clojars" {:url "https://clojars.org/repo"
                                          :creds :gpg}]]
        :dependencies [[org.clojure/clojure "1.10.0"]]
        :plugins [[lein-ancient "0.6.15"]
                  [cider/cider-nrepl "0.21.1"]]}}
