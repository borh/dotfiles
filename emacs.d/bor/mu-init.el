(require 'mu4e)

(use-package mu4e-conversation
  :config
  (global-mu4e-conversation-mode)
  ;; (setq mu4e-view-func 'mu4e-conversation)
  )

(global-set-key (kbd "<f3>") 'mu4e)

(setq mu4e-maildir "/home/bor/Mail")

(setq mu4e-reply-to-address "bor@lang.osaka-u.ac.jp"
      user-mail-address "bor@lang.osaka-u.ac.jp"
      user-full-name  "Bor Hodošček")
(setq mu4e-compose-keep-self-cc 0)

;; allow for updating mail using 'U' in the main view:
(setq mu4e-get-mail-command "offlineimap")

(setq message-send-mail-function   'smtpmail-send-it
      send-mail-function           'smtpmail-send-it
      smtpmail-stream-type         'ssl
      starttls-use-gnutls          t
      ;; smtpmail-default-smtp-server "cc.mail.osaka-u.ac.jp"
      ;; smtpmail-smtp-server         "cc.mail.osaka-u.ac.jp"
      ;; smtpmail-local-domain        "lang.osaka-u.ac.jp"
      smtpmail-auth-credentials    "~/.netrc"
      ;; smtpmail-smtp-service        465
      smtpmail-debug-info t

      mu4e-sent-folder   "/Fastmail/Sent"       ;; sent messages
      mu4e-drafts-folder "/Fastmail/Drafts"     ;; unfinished messages
      mu4e-trash-folder  "/Fastmail/Trash"      ;; trashed messages
      mu4e-refile-folder "/Fastmail/Archive"    ;; saved messages
      ;; if you need offline mode, set these -- and create the queue dir
      ;; with 'mu mkdir', i.e.. mu mkdir /home/user/Mail/queue
      smtpmail-queue-mail  nil
      smtpmail-queue-dir  "/home/bor/Mail/queue/cur")

(setq gnutls-algorithm-priority "NORMAL:%COMPAT")

(load "profile/profile.el")
(require 'profile)

(add-hook 'mu4e-compose-pre-hook #'profile-set-profile-in-compose)
(bind-key "C-c F" #'profile-force-profile-in-compose)

(setq profile-binding-alist
      '(("Osaka-Lang"
         (mu4e-compose-signature       . "Bor Hodošček / ホドシチェク ボル\nGraduate School of Language and Culture, Osaka University\nbor@lang.osaka-u.ac.jp | https://nlp.lang.osaka-u.ac.jp/")
         (user-mail-address            . "bor@lang.osaka-u.ac.jp")
         (smtpmail-default-smtp-server . "cc.mail.osaka-u.ac.jp")
         (smtpmail-smtp-server         . "cc.mail.osaka-u.ac.jp")
         (smtpmail-smtp-user           . "bor+lang")
         (smtpmail-local-domain        . "lang.osaka-u.ac.jp")
         (smtpmail-stream-type         . ssl)
         (smtpmail-smtp-service        . 465))
        ("Fastmail"
         ;; (profile-maildir . "/Fastmail")
         ;; (mu4e-sent-folder . "/Fastmail/Sent")
         ;; (mu4e-drafts-folder . "/Fastmail/Drafts")
         (mu4e-compose-signature       . "Bor Hodošček | contact@bor.space")
         (user-mail-address            . "contact@bor.space")
         (smtpmail-default-smtp-server . "smtp.fastmail.com")
         (smtpmail-local-domain        . "bor.space")
         (smtpmail-smtp-user           . "bor@fastmail.com")
         (smtpmail-smtp-server         . "smtp.fastmail.com")
         (smtpmail-stream-type         . ssl)
         (smtpmail-smtp-service        . 465))))

(setq mu4e-sent-messages-behavior 'sent)
(setq message-kill-buffer-on-exit t)
(setq mu4e-context-policy 'pick-first)
(setq mu4e-confirm-quit nil)
(setq mu4e-use-fancy-chars nil)
(setq mu4e-attachment-dir "~/Downloads")
(setq mu4e-view-show-images t)
(setq mu4e-view-use-gnus t)
(setq mu4e-compose-format-flowed t)

(add-hook 'message-send-hook
          (lambda ()
            (unless (yes-or-no-p "Sure you want to send this? ")
              (signal 'quit nil))))

;; (require 'mu4e-contrib)
;; ;; html2text is deprecated--any replacement?
;; (setq mu4e-html2text-command 'mu4e-shr2text)

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

(use-package mu4e-alert
  :ensure t
  :after mu4e
  :init
  (setq mu4e-alert-interesting-mail-query
        (concat
         "flag:unread maildir:/Fastmail/INBOX"
         "OR "
         "flag:unread maildir:/Fastmail/INBOX.Osaka.Classes"
         "OR "
         "flag:unread maildir:/Fastmail/INBOX.Osaka.Network"))
  (mu4e-alert-enable-mode-line-display)
  (mu4e-alert-set-default-style 'libnotify)
  (defun gjstein-refresh-mu4e-alert-mode-line ()
    (interactive)
    (mu4e~proc-kill)
    (mu4e-alert-enable-mode-line-display))
  (run-with-timer 0 60 'gjstein-refresh-mu4e-alert-mode-line))

(defun mml-attach-file--go-to-eob (orig-fun &rest args)
  "Go to the end of buffer before attaching files."
  (save-excursion
    (save-restriction
      (widen)
      (goto-char (point-max))
      (apply orig-fun args))))

(advice-add 'mml-attach-file :around #'mml-attach-file--go-to-eob)

(add-to-list 'mu4e-header-info-custom
             '(:recipnum .
                         (:name "Number of recipients"  ;; long name, as seen in the message-view
                                :shortname "Recip#"           ;; short name, as seen in the headers view
                                :help "Number of recipients for this message" ;; tooltip
                                :function (lambda (msg)
                                            (format "%d"
                                                    (+ (length (mu4e-message-field msg :to))
                                                       (length (mu4e-message-field msg :cc))))))))

(add-to-list 'mu4e-header-info-custom
             '(:full-mailing-list .
                                  (:name "Mailing-list"               ;; long name, as seen in the message-view
                                         :shortname "ML"                    ;; short name, as seen in the headers view
                                         :help "Full name for mailing list" ;; tooltip
                                         :function (lambda (msg)
                                                     (or (mu4e-message-field msg :mailing-list) "")))))

(setq mu4e-headers-fields
      '((:human-date        .  12)    ;; alternatively, use :human-date
        (:flags             .   6)
        (:full-mailing-list .  10)
        (:from              .  30)
        (:to                .  20)
        (:cc                .   5)
        ;; (:recipnum          .   2)
        (:thread-subject    .  nil)))

;; TODO http://cachestocaches.com/2017/3/complete-guide-email-emacs-using-mu-and-/
