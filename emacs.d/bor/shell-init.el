(defadvice shell (before advice-utf-shell activate)
  (set-default-coding-systems 'utf-8))

(ad-activate 'shell)
