
(setq org-capture-templates
      '(("t" "TODO" entry (file+headline "~/Dropbox/gtd/gtd.org" "GTD")
         "* TODO [#B] %?\n  %i\n"
         :empty-lines 1
         )))
