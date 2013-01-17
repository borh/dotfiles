(define-key  global-map  "\C-\s"  'set-mark-command)

(defun next-user-buffer ()
  "Switch to the next user buffer.
User buffers are those whose name does not start with *."
  (interactive)
  (next-buffer)
  (let ((i 0))
    (while (and (string-match "^*" (buffer-name)) (< i 50))
      (setq i (1+ i)) (next-buffer) )))

(defun previous-user-buffer ()
  "Switch to the previous user buffer.
User buffers are those whose name does not start with *."
  (interactive)
  (previous-buffer)
  (let ((i 0))
    (while (and (string-match "^*" (buffer-name)) (< i 50))
      (setq i (1+ i)) (previous-buffer) )))

(global-set-key (kbd "<C-XF86Forward>") 'previous-user-buffer) ; <C-prior>=Ctrl+PageUp
(global-set-key (kbd "<C-XF86Back>") 'next-user-buffer) ; <C-next>=Ctrl+PageDown

(global-set-key (kbd "M-SPC") 'other-window) ; cursor to other pane

(defun fullscreen-toggle ()
  (interactive)
  (set-frame-parameter nil 'fullscreen
                       (if (frame-parameter nil 'fullscreen) nil 'fullboth)))
(global-set-key (kbd "<f11>")  'fullscreen-toggle)

(defun th-unfill-paragraph ()
  "Do the opposite of `fill-paragraph'; stuff all lines in the
  current paragraph into a single long line."
  (interactive)
  (let ((fill-column most-positive-fixnum))
    (fill-paragraph nil)))

(global-set-key (kbd "C-q") 'th-unfill-paragraph)

(global-set-key (kbd "M-a") 'backward-char) ; was indent-new-comment-line
(global-set-key (kbd "M-o") 'forward-char)  ; was downcase-word
(global-set-key (kbd "M-u") 'previous-line) ; was tab-to-tab-stop
(global-set-key (kbd "M-e") 'next-line) ; was kill-sentence

(defun vi-open-line-above ()
  "Insert a newline above the current line and put point at beginning."
  (interactive)
  (unless (bolp)
    (beginning-of-line))
  (newline)
  (forward-line -1)
  (indent-according-to-mode))

(defun vi-open-line-below ()
  "Insert a newline below the current line and put point at beginning."
  (interactive)
  (unless (eolp)
    (end-of-line))
  (newline-and-indent))

(defun vi-open-line (&optional abovep)
  "Insert a newline below the current line and put point at beginning.
With a prefix argument, insert a newline above the current line."
  (interactive "P")
  (if abovep
      (vi-open-line-above)
    (vi-open-line-below)))

(define-key global-map [(meta o)] 'vi-open-line)
