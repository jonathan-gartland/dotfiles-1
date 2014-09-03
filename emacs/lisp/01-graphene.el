(use-package graphene
  :init 
  (progn
    (setq graphene-speedbar-auto 0
          graphene-geometry-file user-graphene-geometry-file
          projectile-cache-file user-projectile-cache-file
          projectile-known-projects-file user-projectile-known-projects-file)
    (projectile-global-mode)))

(provide 'setup_graphene)
