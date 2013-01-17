(require 'js2-mode)
(require 'js3-mode)
'(js3-auto-indent-p t)         ; it's nice for commas to right themselves.
'(js3-enter-indents-newline t) ; don't need to push tab before typing
'(js3-indent-on-enter-key t)   ; fix indenting before moving on

(eval-after-load 'js
  '(progn (define-key js-mode-map "'" 'paredit-doublequote))) ; TODO check
