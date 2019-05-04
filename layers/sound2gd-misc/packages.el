;;; packages.el --- sound2gd-misc layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2017 Sylvain Benner & Contributors
;;
;; Author: cris wang <cris@crisdeMacBook-Pro.local>
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
;; added to `sound2gd-misc-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `sound2gd-misc/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `sound2gd-misc/pre-init-PACKAGE' and/or
;;   `sound2gd-misc/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

;; 这个layer放置杂项配置
(defconst sound2gd-misc-packages
  '(ranger
     ;; neotree
     helm
     all-the-icons
     treemacs
     dired-narrow))

(defun sound2gd-misc/init-all-the-icons ()
  (use-package all-the-icons))

(defun sound2gd-misc/post-init-treemacs ()
  (message "执行了post-init-treemacs")
  ;; (require 'all-the-icons)
  ;; (require 'doom-themes)
  ;; (doom-themes-treemacs-config)
  )

(defun sound2gd-misc/post-init-helm ()
  )

;; (defun sound2gd-misc/init-neotree ()
;;   (use-package neotree
;;     :commands neotree-toggle
;;     :init
;;     (setq neo-theme (if (display-graphic-p) 'icons 'arrow))
;;     (setq neo-smart-open t)
;;     (setq projectile-switch-project-action 'neotree-projectile-action)
;;     (setq neo-show-hidden-files t)
;;     :config
;;     (require 'all-the-icons)
;;     ))

;; (defun sound2gd-misc/post-init-neotree ()
;;   (spacemacs/set-leader-keys
;;     (kbd "ft") #'neotree-toggle
;;     (kbd "fn") #'ranger
;;     ))

(defun sound2gd-misc/init-ranger ()
  (use-package ranger
    :commands ranger))

(defun sound2gd-misc/init-dired-narrow ()
  (use-package dired-narrow
    :config (define-key dired-mode-map "F" #'dired-narrow)))

;; (defun sound2gd-misc/init-nyan-mode ()
;;   "初始化nyan-mode"
;;   (use-package nyan-mode
;;     :init (nyan-mode)))


;;; packages.el ends here
