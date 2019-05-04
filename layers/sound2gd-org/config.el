
(setq org-capture-templates
      '(("t" "TODO" entry (file+headline "~/Dropbox/gtd/gtd.org" "GTD")
         "* TODO [#B] %?\n  %i\n"
         :empty-lines 1
         )))


;; copy from zilongshanren
(defun sound2gd/org-ispell ()
  "Configure `ispell-skip-region-alist' for `org-mode'."
  (make-local-variable 'ispell-skip-region-alist)
  (add-to-list 'ispell-skip-region-alist '(org-property-drawer-re))
  (add-to-list 'ispell-skip-region-alist '("~" "~"))
  (add-to-list 'ispell-skip-region-alist '("=" "="))
  (add-to-list 'ispell-skip-region-alist '("^#\\+BEGIN_SRC" . "^#\\+END_SRC")))

(add-hook 'org-mode-hook #'sound2gd/org-ispell)
