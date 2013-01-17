;; Send mail through Gmail
(setq smtpmail-stream-type 'ssl)
(setq smtpmail-smtp-server "smtp.gmail.com")
(setq smtpmail-smtp-service 465)

;;(message-send-mail-function 'message-smtpmail-send-it)
