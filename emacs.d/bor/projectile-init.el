(require 'projectile)
(projectile-global-mode) ; Quickly navigate projects using Projectile (C-c p C-h for available commands)
(setq projectile-show-paths-function 'projectile-hashify-with-relative-paths) ; Projectile shows full relative paths

(global-set-key (kbd "C-c h") 'helm-projectile)
