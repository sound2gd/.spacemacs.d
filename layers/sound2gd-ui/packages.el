;;; packages.el --- sound2gd-ui layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2017 Sylvain Benner & Contributors
;;
;; Author: cris wang <cris@crisdeMBP.lan>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;; See the Spacemacs documentation and FAQs for instructions on how to implement
;; a new layer:
;;
;;   SPC h SPC layers RET
;;
;;
;; Briefly, each package to be installed or configured by this layer should be
;; added to `sound2gd-ui-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `sound2gd-ui/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `sound2gd-ui/pre-init-PACKAGE' and/or
;;   `sound2gd-ui/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst sound2gd-ui-packages
  '(
    ;; centaur-tabs
    ;; doom-modeline
    doom-themes
    ;; (snails :location (recipe :fetcher github :repo "manateelazycat/snails"))
    ;; (awesome-tab :location (local "/Users/cris/.spacemacs.d/private/awesome-tab"))
    )
  "The list of Lisp packages required by the sound2gd-ui layer.

Each entry is either:

1. A symbol, which is interpreted as a package to be installed, or

2. A list of the form (PACKAGE KEYS...), where PACKAGE is the
    name of the package to be installed or loaded, and KEYS are
    any number of keyword-value-pairs.

    The following keys are accepted:

    - :excluded (t or nil): Prevent the package from being loaded
      if value is non-nil

    - :location: Specify a custom installation location.
      The following values are legal:

      - The symbol `elpa' (default) means PACKAGE will be
        installed using the Emacs package manager.

      - The symbol `local' directs Spacemacs to load the file at
        `./local/PACKAGE/PACKAGE.el'

      - A list beginning with the symbol `recipe' is a melpa
        recipe.  See: https://github.com/milkypostman/melpa#recipe-format")

;; (defun sound2gd-ui/init-snails ()
;;   (use-package snails
;;     :ensure t
;;     ))

;; (defun sound2gd-ui/init-doom-themes ()
;;   (use-package doom-themes
;;     :ensure t
;;     :config
;;     (progn
;;       (require 'doom-themes)
;;       (setq doom-themes-enable-bold t      ; if nil, bold is universally disabled
;;             doom-themes-enable-italic t)   ; if nil, italics is universally disabled
;;       (load-theme 'doom-one t)
;;       (doom-themes-visual-bell-config)
;;       (doom-themes-neotree-config)
;;       )))

;;(defun sound2gd-ui/post-init-doom-themes ()
;;  (message "post init doom themes")
;;  (load-theme 'doom-horizon))


;; (defun sound2gd-ui/init-doom-modeline ()
;;   (message "init doom modeline")
;;   (use-package doom-modeline
;;     :ensure t))

;; (defun sound2gd-ui/post-init-doom-modeline ()
;;   (message "post init doom modeline")
;;   (require 'doom-modeline)
;;   (doom-modeline-mode t))
;; (defun sound2gd-ui/post-init-doom-themes ()
;;   (doom-modeline-mode t))

;; (defun sound2gd-ui/post-init-centaur-tabs ()
;;   (centaur-tabs-mode t))

;; (defun sound2gd-ui/init-centaur-tabs ()
;;   (use-package centaur-tabs
;;     :ensure t
;;     :config
;;     (progn
;;       (setq centaur-tabs-style "wave")
;;       ;; (setq centaur-tabs-height 32)
;;       (setq centaur-tabs-set-icons t)
;;       ;; (setq centaur-tabs-set-bar 'over)
;;       (setq centaur-tabs-set-modified-marker t)
;;       (centaur-tabs-headline-match)
;;       (defun centaur-tabs-buffer-groups ()
;;         "`centaur-tabs-buffer-groups' control buffers' group rules.

;;  Group centaur-tabs with mode if buffer is derived from `eshell-mode' `emacs-lisp-mode' `dired-mode' `org-mode' `magit-mode'.
;;  All buffer name start with * will group to \"Emacs\".
;;  Other buffer group by `centaur-tabs-get-group-name' with project name."
;;         (list
;;          (cond
;;           ((or (string-equal "*" (substring (buffer-name) 0 1))
;;                (memq major-mode '(magit-process-mode
;;                                   magit-status-mode
;;                                   magit-diff-mode
;;                                   magit-log-mode
;;                                   magit-file-mode
;;                                   magit-blob-mode
;;                                   magit-blame-mode
;;                                   )))
;;            "Emacs")
;;           ((derived-mode-p 'prog-mode)
;;            "Editing")
;;           ((derived-mode-p 'dired-mode)
;;            "Dired")
;;           ((memq major-mode '(helpful-mode
;;                               help-mode))
;;            "Help")
;;           ((memq major-mode '(org-mode
;;                               org-agenda-clockreport-mode
;;                               org-src-mode
;;                               org-agenda-mode
;;                               org-beamer-mode
;;                               org-indent-mode
;;                               org-bullets-mode
;;                               org-cdlatex-mode
;;                               org-agenda-log-mode
;;                               diary-mode))
;;            "OrgMode")
;;           (t
;;            (centaur-tabs-get-group-name (current-buffer))))))
;;       )
;;     :bind
;;     (:map evil-normal-state-map
;;           ("g t" . centaur-tabs-forward)
;;           ("g T" . centaur-tabs-backward))
;;     ("C-c t" . centaur-tabs-counsel-switch-group)
;;     :hook
;;     (dashboard-mode . centaur-tabs-local-mode)
;;     (term-mode . centaur-tabs-local-mode)
;;     (calendar-mode . centaur-tabs-local-mode)
;;     (org-agenda-mode . centaur-tabs-local-mode)
;;     (helpful-mode . centaur-tabs-local-mode)
;;     )
;;   )

;;; packages.el ends here
