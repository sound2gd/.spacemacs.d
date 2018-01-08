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
  '())

;; (defun sound2gd-misc/init-nyan-mode ()
;;   "初始化nyan-mode"
;;   (use-package nyan-mode
;;     :init (nyan-mode)))


;;; packages.el ends here
