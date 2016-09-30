(use-package
  notmuch
  :config

  (setq notmuch-saved-searches
        (quote
         ((:name "Osaka" :query "tag:INBOX.INBOX.Osaka" :key "o" :sort-order newest-first)
          (:name "Hinoki Project" :query "tag:INBOX.INBOX.Hinoki\ Project" :key "h" :sort-order newest-first)
          (:name "inbox" :query "tag:inbox" :key "i" :sort-order newest-first)
          (:name "unread" :query "tag:unread" :key "u" :sort-order newest-first)
          (:name "flagged" :query "tag:flagged" :key "f" :sort-order newest-first)
          (:name "sent" :query "tag:sent" :key "t" :sort-order newest-first)
          (:name "drafts" :query "tag:draft" :key "d" :sort-order newest-first)
          (:name "all mail" :query "*" :key "a" :sort-order newest-first))))

  (require 'org-notmuch)

  ;; Disabled until svg display is fixed in emacs-mac:
  ;; (require 'notmuch-labeler)
  ;; (notmuch-labeler-image-tag "attachment")
  ;; (notmuch-labeler-image-star "flagged")
  (setq message-send-mail-function   'smtpmail-send-it
        smtpmail-stream-type         'ssl
        smtpmail-default-smtp-server "cc.mail.osaka-u.ac.jp"
        smtpmail-smtp-server         "cc.mail.osaka-u.ac.jp"
        smtpmail-local-domain        "lang.osaka-u.ac.jp"
        smtpmail-auth-credentials    "~/.netrc"
        smtpmail-smtp-service        465

        ;; if you need offline mode, set these -- and create the queue dir
        ;; with 'mu mkdir', i.e.. mu mkdir /home/user/Mail/queue
        smtpmail-queue-mail  nil
        smtpmail-queue-dir  "~/Mail/queue/cur"))
