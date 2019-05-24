(use-package org
  :ensure org-plus-contrib
  :config

  (setq org-directory "~/Cloud/Org")
  (setq org-agenda-files (directory-files-recursively "~/Cloud/" "\\.org$")
        ;; '("~/Cloud/Org")
        )
  (set-register ?c (cons 'file "~/Cloud/Org/Classes.org"))
  (set-register ?r (cons 'file "~/Cloud/Org/Research.org"))
  (set-register ?d (cons 'file "~/Cloud/Org/Devops.org"))
  (set-register ?a (cons 'file "~/Cloud/Org/Administration.org"))
  (set-register ?p (cons 'file "~/Cloud/Org/Private.org"))

  (global-set-key (kbd "C-c l") 'org-store-link)
  (global-set-key (kbd "C-c C-l") 'org-insert-link)
  (global-set-key (kbd "C-c C-o") 'org-open-at-point-global)
  (global-set-key (kbd "<f1>") 'org-agenda)
  (global-set-key (kbd "<f6>") 'calendar)
  (global-set-key (kbd "<f5>") 'org-publish)
  (global-set-key (kbd "<f12>") 'org-clock-goto)

  (set-face-attribute 'org-table nil :inherit 'fixed-pitch)

  (setq org-default-notes-file (concat org-directory "/Notes.org"))
  (define-key global-map (kbd "<f2>") 'org-capture)

  (setq org-startup-with-inline-images t)

  (require 'org-protocol)
  (defun transform-square-brackets-to-round-ones (string-to-transform)
    "Transforms [ into ( and ] into ), other chars left unchanged."
    (concat
     (mapcar #'(lambda (c) (if (equal c ?\[) ?\( (if (equal c ?\]) ?\) c))) string-to-transform)))
  (setq org-capture-templates
        `(("r" "Protocol" entry (file+headline ,(concat org-directory "/Notes.org") "Inbox")
           "* %^{Title}\nSource: %u, %c\n #+BEGIN_QUOTE\n%i\n#+END_QUOTE\n\n\n%?")
          ("L" "Protocol Link" entry (file+headline ,(concat org-directory "/Notes.org") "Inbox")
           "* %? [[%:link][%(transform-square-brackets-to-round-ones \"%:description\")]]\n")))

  (setq org-refile-targets '((nil :maxlevel . 3)
                             ;; all top-level headlines in the
                             ;; current buffer are used (first) as a
                             ;; refile target
                             (org-agenda-files :maxlevel . 3)))

  (setq org-todo-keywords '((sequence "☛ TODO(t)" "|" "✔ DONE(d)")
                            (sequence "⚑ WAITING(w)" "|")
                            (sequence "|" "✘ CANCELED(c)")))

  ;; (setq org-todo-keywords
  ;;       '((sequence "TODO" "WAITING" "NEXT" "|" "DONE" "CANCELED")))

  (setq org-enforce-todo-checkbox-dependencies t)

  ;; (setq org-caldav-calendars
  ;;       '((:calendar-id "<<Calendar-id>>"
  ;;                       :url         "<<Main url>>"
  ;;                       :inbox       "<<LOCAL ORG FILE TO RECEIVE EVENTS>>"
  ;;                       :files       ("<<LOCAL FILE TO PUSH EVENTS>>"))
  ;;         (:calendar-id "<<Calendar-id>>"
  ;;                       :url         "<<Main url>>"
  ;;                       :inbox       "<<LOCAL ORG FILE TO RECEIVE EVENTS>>"
  ;;                       :files       ("<<LOCAL FILE TO PUSH EVENTS>>"))))

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
    (setq org-reveal-root "file:///home/bor/Cloud/Org/reveal.js-3.2.0/")
    (setq org-reveal-hlevel 2)

    (setq org-src-fontify-natively t))

  (use-package org-bullets
    :config
    (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

  (use-package org-fancy-priorities
    :config
    (setq org-fancy-priorities-list '("HIGH" "MID" "LOW" "OPTIONAL")))

  (use-package ox-twbs
    :config
    ())

  (use-package org-ac
    :config
    (org-ac/config-default))

  (use-package org-autolist
    :config
    (add-hook 'org-mode-hook (lambda () (org-autolist-mode))))

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

  ;; ;; These two packages allow annotation of PDFs with org-mode
  ;; (use-package pdf-tools)
  ;; (use-package interleave)

  (require 'netrc)

  (defun get-authinfo (host)
    (let* ((netrc (netrc-parse (expand-file-name "~/.netrc")))
           (hostentry (netrc-machine netrc host)))
      (when hostentry (netrc-get hostentry "password"))))

  ;; (use-package org-gcal
  ;;   :config
  ;;   (setq org-gcal-client-id (get-authinfo "gcal.client-id")
  ;;         org-gcal-client-secret (get-authinfo "gcal.client-secret")
  ;;         org-gcal-file-alist '('((get-authinfo "gcal.work-calendar") . (concat org-directory "/Work-Calendar.org"))
  ;;                               '((get-authinfo "gcal.personal-calendar") . (concat org-directory "/Personal-Calendar.org")))))

  (use-package org-msg
    ;; TODO
    )

  (require 'ox-publish)
  (setq org-publish-project-alist
        '(("org-html"
           :base-directory "~/Cloud/Org/nlp/"
           :base-extension "org" ;; "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf"
           :publishing-directory "~/Cloud/Org/Publish/nlp/"
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
           :base-directory "~/Cloud/Org/nlp/"
           :base-extension "css\\|woff2\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf"
           :publishing-directory "~/Cloud/Org/Publish/nlp/"
           :recursive t
           :publishing-function org-publish-attachment
           )
          ("org" :components ("org-html" "org-static")))))

(use-package org-projectile
  :bind (("C-c n p" . org-projectile-project-todo-completing-read))
  :config
  (progn
    (org-projectile-per-project)
    (setq org-projectile-per-project-filepath "Notes.org")
    (setq org-agenda-files (append org-agenda-files (org-projectile-todo-files)))
    (push (org-projectile-project-todo-entry) org-capture-templates))
  :ensure t)

(use-package org-super-agenda
  ;; :defer t
  :config
  (progn
    (org-super-agenda-mode +1)
    (setq org-super-agenda-groups
          '((:order-multi (1 (:name "High priority"
                                    :priority> "MID")))
            (:order-multi (1 (:name "Done today"
                                    :and (:regexp "State \"DONE\""
                                                  :log t))))))))
