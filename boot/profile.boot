(import java.io.File)

;; Get credentials from a GPG encrypted file.
(configure-repositories!
 (let [creds-file (File. (boot.App/bootdir) "credentials.gpg")
       creds-data (gpg-decrypt creds-file :as :edn)]
   (fn [{:keys [url] :as repo-map}]
     (merge repo-map (creds-data url)))))

;;(task-options! push {:repo "https://repo.clojars.org/"})

(deftask cider "CIDER profile"
  []
  (require 'boot.repl)
  (swap! @(resolve 'boot.repl/*default-dependencies*)
         concat '[[criterium "0.4.4" :exclusions [org.clojure/clojure] :scope "test"]
                  [org.clojure/tools.nrepl "0.2.13" :scope "test"]
                  [cider/cider-nrepl "0.16.0" :scope "test"]
                  [refactor-nrepl "2.4.0-SNAPSHOT" :scope "test"]])
  (swap! @(resolve 'boot.repl/*default-middleware*)
         concat '[cider.nrepl/cider-middleware
                  refactor-nrepl.middleware/wrap-refactor])
  identity)
