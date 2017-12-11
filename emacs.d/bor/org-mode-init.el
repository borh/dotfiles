(use-package org
  :ensure org-plus-contrib
  :config

  (setq org-directory "~/Dropbox/Org")
  (setq org-agenda-files '("~/Dropbox/Org"))
  (set-register ?c (cons 'file "~/Dropbox/Org/Classes.org"))
  (set-register ?r (cons 'file "~/Dropbox/Org/Research.org"))
  (set-register ?d (cons 'file "~/Dropbox/Org/Devops.org"))
  (set-register ?a (cons 'file "~/Dropbox/Org/Administration.org"))
  (set-register ?p (cons 'file "~/Dropbox/Org/Private.org"))

  (global-set-key (kbd "C-c l") 'org-store-link)
  (global-set-key (kbd "C-c C-l") 'org-insert-link)
  (global-set-key (kbd "C-c C-o") 'org-open-at-point-global)
  (global-set-key (kbd "<f1>") 'org-agenda)
  (global-set-key (kbd "<f3>") 'calendar)
  (global-set-key (kbd "<f5>") 'org-publish)
  (global-set-key (kbd "<f12>") 'org-clock-goto)

  (set-face-attribute 'org-table nil :inherit 'fixed-pitch)

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

  ;;(setq org-export-in-background t)

  (setq org-fontify-whole-heading-line t
        org-fontify-done-headline t
        org-fontify-quote-and-verse-blocks t)

  (use-package org-alert
    :config
    (setq alert-default-style 'libnotify))

  (use-package ox-reveal
    :config
    (setq org-reveal-root "file:///home/bor/Dropbox/Org/reveal.js-3.2.0/")
    (setq org-reveal-hlevel 2)

    (setq org-src-fontify-natively t))

  (use-package org-bullets
    :config
    (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

  (use-package ox-twbs
    :config
    ())

  ;; 1. hook flyspell into org-mode
  (add-hook 'org-mode-hook 'flyspell-mode)
  (add-hook 'org-mode-hook 'flyspell-buffer)

  ;; 2. ignore message flags
  (setq flyspell-issue-message-flag nil)

  ;; 3. ignore tex commands
  (add-hook 'org-mode-hook (lambda () (setq ispell-parser 'tex)))
  (defun flyspell-ignore-tex ()
    (interactive)
    (set (make-variable-buffer-local 'ispell-parser) 'tex))
  (add-hook 'org-mode-hook 'flyspell-ignore-tex)

  (require 'ox-publish)
  (setq org-publish-project-alist
        '(("org-html"
           :base-directory "~/Dropbox/Org/nlp/"
           :base-extension "org" ;; "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf"
           :publishing-directory "~/Dropbox/Org/Publish/nlp/"
           :recursive t
           ;;:html-doctype "html5"
           ;;:html-html5-fancy t
           :html-head  "<link rel=\"stylesheet\" href=\"./bower_components/bootstrap/dist/css/bootstrap.min.css\" type=\"text/css\"/>
<link rel=\"stylesheet\" href=\"./css/styles.css\" type=\"text/css\"/>
<link rel=\"stylesheet\" href=\"./css/equity-concourse.css\" type=\"text/css\"/>\n
<script src=\"./bower_components/jquery/dist/jquery.min.js\"></script>
<script src=\"./bower_components/tether/dist/js/tether.min.js\"></script>
<script src=\"./bower_components/bootstrap/dist/js/bootstrap.min.js\"></script>"
           ;; :html-head-extra "<script src=\"https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js\"></script>
           ;;    <script src=\"/js/magic.js\"></script>
           ;;    <link rel=\"icon\" href=\"/img/dragon.svg\">
           ;;    <link rel=\"shortcut icon\" href=\"/img/dragon-head.png\">
           ;;    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\" />"
           :publishing-function org-twbs-publish-to-html ;;org-html-publish-to-html ;;org-publish-attachment
           )
          ("org-static"
           :base-directory "~/Dropbox/Org/nlp/"
           :base-extension "css\\|woff2\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf"
           :publishing-directory "~/Dropbox/Org/Publish/nlp/"
           :recursive t
           :publishing-function org-publish-attachment
           )
          ("org" :components ("org-html" "org-static")))))
