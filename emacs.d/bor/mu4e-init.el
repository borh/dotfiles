;; (require 'mu4e)
;; (setq
;;  mu4e-maildir       "~/Mail"
;;  mu4e-sent-folder   "/sent"
;;  mu4e-drafts-folder "/drafts"
;;  mu4e-trash-folder  "/trash"
;;  mu4e-refile-folder "/archive")
;;
;; ;; tell message-mode how to send mail
;; (setq message-send-mail-function 'smtpmail-send-it)
;; ;; if our mail server lives at smtp.example.org; if you have a local
;; ;; mail-server, simply use 'localhost' here.
;; (setq smtpmail-smtp-server "smtp.gmail.com")
;;
;; ;; don't save messages to Sent Messages, Gmail/IMAP takes care of this
;; (setq mu4e-sent-messages-behavior 'delete)
