;;; packages.el --- sound2gd-programming layer packages file for Spacemacs.
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
;; added to `sound2gd-programming-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `sound2gd-programming/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `sound2gd-programming/pre-init-PACKAGE' and/or
;;   `sound2gd-programming/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

;; 这个layer主要放置和编程有关的配置
(defconst sound2gd-programming-packages
  '(cider
    company
    nodejs-repl
    ;; nodejs-repl-eval
    tagedit
    js2-mode
    js-doc
    json-mode
    css-mode
    web-mode
    editorconfig
    ))

(defun sound2gd-programming/post-init-js2-mode ()
  (progn
    ;; (add-hook 'js2-mode-hook 'my-setup-develop-environment)
    ;; (add-hook 'web-mode-hook 'my-setup-develop-environment)

    (spacemacs|define-jump-handlers js2-mode)
    (add-hook 'spacemacs-jump-handlers-js2-mode 'etags-select-find-tag-at-point)

    (setq company-backends-js2-mode '((company-dabbrev-code :with company-keywords company-etags)
                                      company-files company-dabbrev))

    (sound2gd|toggle-company-backends company-tern)

    (spacemacs/set-leader-keys-for-major-mode 'js2-mode
      "tb" 'sound2gd/company-toggle-company-tern)

    (add-hook 'js2-mode-hook 'sound2gd//js2-mode-hook)

    ;; add your own keywords highlight here
    (font-lock-add-keywords 'js2-mode
                            '(("\\<\\(cc\\)\\>" 1 font-lock-type-face)))

    (spacemacs/declare-prefix-for-mode 'js2-mode "ms" "repl")

    (with-eval-after-load 'js2-mode
      (progn
        ;; these mode related variables must be in eval-after-load
        ;; https://github.com/magnars/.emacs.d/blob/master/settings/setup-js2-mode.el
        (setq-default js2-allow-rhino-new-expr-initializer nil)
        (setq-default js2-auto-indent-p nil)
        (setq-default js2-enter-indents-newline nil)
        (setq-default js2-global-externs '("module" "ccui" "require" "buster" "sinon" "assert" "refute" "setTimeout" "clearTimeout" "setInterval" "clearInterval" "location" "__dirname" "console" "JSON"))
        (setq-default js2-idle-timer-delay 0.2)
        (setq-default js2-mirror-mode nil)
        (setq-default js2-strict-inconsistent-return-warning nil)
        (setq-default js2-include-rhino-externs nil)
        (setq-default js2-include-gears-externs nil)
        (setq-default js2-concat-multiline-strings 'eol)
        (setq-default js2-rebind-eol-bol-keys nil)
        (setq-default js2-auto-indent-p t)

        (setq-default js2-bounce-indent nil)
        (setq-default js-indent-level 4)
        (setq-default js2-basic-offset 4)
        (setq-default js-switch-indent-offset 4)
        ;; Let flycheck handle parse errors
        (setq-default js2-mode-show-parse-errors nil)
        (setq-default js2-mode-show-strict-warnings nil)
        (setq-default js2-highlight-external-variables t)
        (setq-default js2-strict-trailing-comma-warning nil)

        (add-hook 'web-mode-hook 'sound2gd//web-mode-indent-setup)

        (spacemacs/set-leader-keys-for-major-mode 'js2-mode
          "ti" 'sound2gd//toggle-web-intent)
        (spacemacs/set-leader-keys-for-major-mode 'js-mode
          "ti" 'sound2gd//toggle-web-intent)
        (spacemacs/set-leader-keys-for-major-mode 'web-mode
          "ti" 'sound2gd//toggle-web-intent)
        (spacemacs/set-leader-keys-for-major-mode 'css-mode
          "ti" 'sound2gd//toggle-web-intent)

        (spacemacs/declare-prefix-for-mode 'js2-mode "mt" "toggle")
        (spacemacs/declare-prefix-for-mode 'js-mode "mt" "toggle")
        (spacemacs/declare-prefix-for-mode 'web-mode "mt" "toggle")
        (spacemacs/declare-prefix-for-mode 'css-mode "mt" "toggle")


        (eval-after-load 'tern-mode
          '(spacemacs|hide-lighter tern-mode))
        ))
    (evilified-state-evilify js2-error-buffer-mode js2-error-buffer-mode-map)
    ))


(defun sound2gd-programming/post-init-js-doc ()
  (setq js-doc-mail-address "wanghuan@tuya.com"
        js-doc-author (format "Sound2gd <%s>" js-doc-mail-address)
        js-doc-url "http://sound2gd.wang"
        js-doc-license "MIT"))

(defun sound2gd-programming/init-editorconfig ()
  (use-package editorconfig
    :init
    (progn
      (defun conditional-enable-editorconfig ()
        (if (locate-dominating-file default-directory ".editorconfig")
            (editorconfig-apply)))
      (add-hook 'prog-mode-hook 'conditional-enable-editorconfig))))

(defun sound2gd-programming/post-init-web-mode ()
  (with-eval-after-load "web-mode"
    (web-mode-toggle-current-element-highlight)
    (web-mode-dom-errors-show))
  (setq company-backends-web-mode '((company-dabbrev-code
                                     company-keywords
                                     company-etags)
                                    company-files company-dabbrev)))

(defun sound2gd-programming/init-nodejs-repl ()
  (use-package nodejs-repl
    :init
    :defer t))

(defun sound2gd-programming/post-init-json-mode ()
  (add-to-list 'auto-mode-alist '("\\.tern-project\\'" . json-mode))
  (add-to-list 'auto-mode-alist '("\\.fire\\'" . json-mode))
  (add-to-list 'auto-mode-alist '("\\.fire.meta\\'" . json-mode))
  (spacemacs/set-leader-keys-for-major-mode 'json-mode
    "ti" 'my-toggle-web-indent))

(defun sound2gd-programming/post-init-css-mode ()
  (progn
    (dolist (hook '(css-mode-hook sass-mode-hook less-mode-hook))
      (add-hook hook 'rainbow-mode))

    (defun css-imenu-make-index ()
      (save-excursion
        (imenu--generic-function '((nil "^ *\\([^ ]+\\) *{ *$" 1)))))

    (add-hook 'css-mode-hook
              (lambda ()
                (setq imenu-create-index-function 'css-imenu-make-index)))))


(defun sound2gd-programming/init-tagedit ()
  (use-package tagedit))

(defun sound2gd-programming/post-init-tagedit ()
  (add-hook 'web-mode-hook (lambda () (tagedit-mode 1))))

;; (defun sound2gd-programming/init-nodejs-repl-eval ()
;;   (use-package nodejs-repl-eval
;;     :commands (nodejs-repl-eval-buffer nodejs-repl-eval-dwim nodejs-repl-eval-function)
;;     :init
;;     (progn
;;       (spacemacs/declare-prefix-for-mode 'js2-mode
;;         "ms" "REPL")
;;       (spacemacs/set-leader-keys-for-major-mode 'js2-mode
;;         "sb" 'nodejs-repl-eval-buffer
;;         "sf" 'nodejs-repl-eval-function
;;         "sd" 'nodejs-repl-eval-dwim))
;;     :defer t
;;     ))

(defun sound2gd-programming/post-init-company ()
  (progn
    (setq company-minimum-prefix-length 1
          company-idle-delay 0.08)

    (when (configuration-layer/package-usedp 'company)
      (spacemacs|add-company-backends :modes shell-script-mode sh-mode nxml-mode conf-unix-mode json-mode ))
    ))

;; =========================================================
;; clojure相关
;; =========================================================
(defun sound2gd-programming/post-init-cider ()
  "在cider包加载完成之后，修复deps.edn依赖问题"
  (message "执行了post-init-cider")
  (add-hook 'cider-mode-hook #'sound2gd/fix-clj-edn-deps))

;; =========================================================
;;; packages.el ends here
