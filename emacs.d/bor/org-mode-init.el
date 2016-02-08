(setq org-directory "~/Dropbox/Org")
(setq org-agenda-files '("~/Dropbox/Org"))
(set-register ?c (cons 'file "~/Dropbox/Org/Classes.org"))
(set-register ?r (cons 'file "~/Dropbox/Org/Research.org"))
(set-register ?d (cons 'file "~/Dropbox/Org/Devops.org"))
(set-register ?a (cons 'file "~/Dropbox/Org/Administration.org"))
(set-register ?p (cons 'file "~/Dropbox/Org/Private.org"))

(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-c\C-l" 'org-insert-link)
(global-set-key "\C-c\C-o" 'org-open-at-point-global)
(global-set-key (kbd "<f1>") 'org-agenda)
(global-set-key (kbd "<f3>") 'calendar)
(global-set-key (kbd "<f12>") 'org-clock-goto)

(setq org-default-notes-file (concat org-directory "/Notes.org"))
(define-key global-map (kbd "<f2>") 'org-capture)

(setq org-refile-targets '((nil :maxlevel . 3)
                           ;; all top-level headlines in the
                           ;; current buffer are used (first) as a
                           ;; refile target
                           (org-agenda-files :maxlevel . 3)))

(setq org-todo-keywords
      '((sequence "TODO" "WAITING" "NEXT" "|" "DONE" "CANCELED")))

(setq org-enforce-todo-checkbox-dependencies t)

(setq org-caldav-calendars
  '((:calendar-id "<<Calendar-id>>"
     :url         "<<Main url>>"
     :inbox       "<<LOCAL ORG FILE TO RECEIVE EVENTS>>"
     :files       ("<<LOCAL FILE TO PUSH EVENTS>>"))
    (:calendar-id "<<Calendar-id>>"
     :url         "<<Main url>>"
     :inbox       "<<LOCAL ORG FILE TO RECEIVE EVENTS>>"
     :files       ("<<LOCAL FILE TO PUSH EVENTS>>"))))

;; (add-hook 'org-mode-hook
;;           (lambda ()
;;             (org-multiple-keymap-minor-mode 0)))

(require 'org-alert)
(setq alert-default-style 'libnotify)

(require 'ox-reveal)
(setq org-reveal-root "file:///home/bor/Dropbox/Org/reveal.js-3.2.0/")
(setq org-reveal-hlevel 2)

(setq org-src-fontify-natively t)
