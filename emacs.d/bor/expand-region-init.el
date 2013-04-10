(require 'expand-region)
(defun er/add-text-mode-expansions ()
  (make-variable-buffer-local 'er/try-expand-list)
  (setq er/try-expand-list (append
                            er/try-expand-list
                            '(mark-paragraph
                              mark-page))))

(er/enable-mode-expansions 'text-mode 'er/add-text-mode-expansions)

(global-set-key (kbd "C-=") 'er/expand-region)
