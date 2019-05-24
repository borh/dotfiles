(use-package calfw
  :config
  (setq cfw:fchar-junction ?╋
        cfw:fchar-vertical-line ?┃
        cfw:fchar-horizontal-line ?━
        cfw:fchar-left-junction ?┣
        cfw:fchar-right-junction ?┫
        cfw:fchar-top-junction ?┯
        cfw:fchar-top-left-corner ?┏
        cfw:fchar-top-right-corner ?┓))

(use-package calfw-org)

(use-package calfw-ical
  :config

  ;; (cfw:open-ical-calendar "http://www.google.com/calendar/ical/.../basic.ics")
  )
