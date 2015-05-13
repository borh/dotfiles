(add-to-list 'load-path "/run/current-system/sw/share/emacs/site-lisp/mu4e")
(require 'mu4e)

(setq mu4e-maildir "/home/bor/Mail")

(setq mu4e-get-mail-command "offlineimap")

(setq mu4e-reply-to-address "bor@lang.osaka-u.ac.jp"
      user-mail-address "bor@lang.osaka-u.ac.jp"
      user-full-name  "Bor Hodošček")
(setq mu4e-compose-signature
      "Bor Hodošček, Lecturer\nGraduate School for Language and Culture\nOsaka University")

;; allow for updating mail using 'U' in the main view:
(setq mu4e-get-mail-command "offlineimap")

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
      smtpmail-queue-dir  "/home/bor/Mail/queue/cur")

;; don't keep message buffers around
(setq message-kill-buffer-on-exit t)

(setq mu4e-use-fancy-chars t)
(setq mu4e-attachment-dir "~/Downloads")
(setq mu4e-view-show-images t)

(add-hook 'mu4e-compose-mode-hook
          ;;"Outgoing mails get format=flowed."
          (defun cpb-compose-setup ()
            (use-hard-newlines t 'guess)))

(add-hook 'message-send-hook
  (lambda ()
    (unless (yes-or-no-p "Sure you want to send this?")
      (signal 'quit nil))))
