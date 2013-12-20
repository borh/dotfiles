(defun toggle-fullscreen ()
  (interactive)
  (x-send-client-message nil 0 nil "_NET_WM_STATE" 32
	    		 '(2 "_NET_WM_STATE_MAXIMIZED_VERT" 0))
  (x-send-client-message nil 0 nil "_NET_WM_STATE" 32
	    		 '(2 "_NET_WM_STATE_MAXIMIZED_HORZ" 0)))

(setq visible-bell t)

(if (display-graphic-p)
    (progn
      (menu-bar-mode -1)
      (tool-bar-mode -1)
      (scroll-bar-mode -1)
      (toggle-fullscreen)))

(add-hook 'text-mode-hook
          '(lambda() (set-fill-column 100))) ; better, longer default

(require 'god-mode)
