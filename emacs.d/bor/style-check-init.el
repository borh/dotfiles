(defun style-check-file ()
  (interactive)
  (compile (format "style-check.rb -v %s" (buffer-file-name))))
(global-set-key "\C-cs" 'style-check-file)
