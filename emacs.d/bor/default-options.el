; (scroll-bar-mode -1)
(remove-hook 'prog-mode-hook 'esk-turn-on-hl-line-mode)
(remove-hook 'prog-mode-hook 'auto-fill-mode)
(remove-hook 'text-mode-hook 'auto-fill-mode)
(dolist (f '(menu-bar-mode scroll-bar-mode tool-bar-mode)) (funcall f -1))
(add-hook 'text-mode-hook
          '(lambda() (set-fill-column 100))) ; better, longer default
