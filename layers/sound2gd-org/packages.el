;;; packages.el --- sound2gd-org layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2017 Sylvain Benner & Contributors
;;
;; Author: cris wang <429354772@qq.com>
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
;; added to `sound2gd-org-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `sound2gd-org/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `sound2gd-org/pre-init-PACKAGE' and/or
;;   `sound2gd-org/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst sound2gd-org-packages
  '(org-bullets
    org-pomodoro
    ))

(defun sound2gd-org/post-init-org-bullets ()
  ;; 设置org-header的bullet
  ;; (setq org-bullets-bullet-list '("☰" "☷" "☯" "☭"))
  )

(defun sound2gd-org/post-init-org-pomodoro ()
  (progn
    (add-hook 'org-pomodoro-finished-hook '(lambda () (sound2gd/growl-notification "Pomodoro Finished" "☕️ Have a break!" t)))
    (add-hook 'org-pomodoro-short-break-finished-hook '(lambda () (sound2gd/growl-notification "Short Break" "🐝 Ready to Go?" t)))
    (add-hook 'org-pomodoro-long-break-finished-hook '(lambda () (sound2gd/growl-notification "Long Break" " 💪 Ready to Go?" t)))
    ))


;;; packages.el ends here
