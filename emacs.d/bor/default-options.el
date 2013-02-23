; (scroll-bar-mode -1)
(remove-hook 'prog-mode-hook 'esk-turn-on-hl-line-mode)
(remove-hook 'prog-mode-hook 'auto-fill-mode)
(remove-hook 'text-mode-hook 'auto-fill-mode)
(if (display-graphic-p)
    (progn
      (menu-bar-mode -1)
      (tool-bar-mode -1)
      (scroll-bar-mode -1)))
(add-hook 'text-mode-hook
          '(lambda() (set-fill-column 100))) ; better, longer default
