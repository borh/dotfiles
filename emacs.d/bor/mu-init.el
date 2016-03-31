(add-to-list 'load-path "/run/current-system/sw/share/emacs/site-lisp/mu4e")
(require 'mu4e)

(setq mu4e-maildir "/home/bor/Mail")

(setq mu4e-get-mail-command "offlineimap")

(setq mu4e-reply-to-address "bor@lang.osaka-u.ac.jp"
      user-mail-address "bor@lang.osaka-u.ac.jp"
      user-full-name  "Bor Hodošček")
(setq mu4e-compose-signature
      "Bor Hodošček\nGraduate School of Language and Culture, Osaka University\nbor@lang.osaka-u.ac.jp | osaka@bor.space")
(setq mu4e-compose-keep-self-cc 0)

;; allow for updating mail using 'U' in the main view:
(setq mu4e-get-mail-command "offlineimap")

(setq message-send-mail-function   'smtpmail-send-it
      smtpmail-stream-type         'ssl
      smtpmail-default-smtp-server "cc.mail.osaka-u.ac.jp"
      smtpmail-smtp-server         "cc.mail.osaka-u.ac.jp"
      smtpmail-local-domain        "lang.osaka-u.ac.jp"
      smtpmail-auth-credentials    "~/.netrc"
      smtpmail-smtp-service        465

      mu4e-sent-folder   "/Fastmail/INBOX.Sent"       ;; sent messages
      mu4e-drafts-folder "/Fastmail/INBOX.Drafts"     ;; unfinished messages
      mu4e-trash-folder  "/Fastmail/INBOX.Trash"      ;; trashed messages
      mu4e-refile-folder "/archive"    ;; saved messages
      ;; if you need offline mode, set these -- and create the queue dir
      ;; with 'mu mkdir', i.e.. mu mkdir /home/user/Mail/queue
      smtpmail-queue-mail  nil
      smtpmail-queue-dir  "/home/bor/Mail/queue/cur")


;; don't keep message buffers around
(setq message-kill-buffer-on-exit t)

(setq mu4e-use-fancy-chars t)
(setq mu4e-attachment-dir "~/Downloads")
(setq mu4e-view-show-images t)

;; (add-hook 'mu4e-compose-mode-hook
;;           ;;"Outgoing mails get format=flowed."
;;           (defun cpb-compose-setup ()
;;             (use-hard-newlines t 'guess)))

(add-hook 'message-send-hook
  (lambda ()
    (unless (yes-or-no-p "Sure you want to send this?")
      (signal 'quit nil))))

(require 'mu4e-contrib)
(setq mu4e-html2text-command 'mu4e-shr2text)

(require 'org-mu4e)

(require 'gnus-dired)
;; make the `gnus-dired-mail-buffers' function also work on
;; message-mode derived modes, such as mu4e-compose-mode
(defun gnus-dired-mail-buffers ()
  "Return a list of active message buffers."
  (let (buffers)
    (save-current-buffer
      (dolist (buffer (buffer-list t))
        (set-buffer buffer)
        (when (and (derived-mode-p 'message-mode)
                   (null message-sent-message-via))
          (push (buffer-name buffer) buffers))))
    (nreverse buffers)))

(setq gnus-dired-mail-mode 'mu4e-user-agent)
(add-hook 'dired-mode-hook 'turn-on-gnus-dired-mode)
