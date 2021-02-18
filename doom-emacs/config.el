;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; refresh' after modifying this file!


;; These are used for a number of things, particularly for GPG configuration,
;; some email clients, file templates and snippets.
(setq user-full-name "Chris"
      user-mail-address "429354772@qq.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; test
(setq doom-font (font-spec :family "Fira Code" :size 18)
      doom-variable-pitch-font (font-spec :family "Fira Code"))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. These are the defaults.
(setq doom-theme 'doom-one-light)

;; If you intend to use org, it is recommended you change this!
(setq org-directory "~/Drpobox/gtd/")

;; If you want to change the style of line numbers, change this to `relative' or
;; `nil' to disable it:
(setq display-line-numbers-type t)

(add-to-list 'initial-frame-alist '(fullscreen . maximized))


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', where Emacs
;;   looks when you load packages with `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c g k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c g d') to jump to their definition and see how
;; they are implemented.
;; (custom-set-variables
;;  ;; custom-set-variables was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(custom-safe-themes
;;    '("e074be1c799b509f52870ee596a5977b519f6d269455b84ed998666cf6fc802a" "9b272154fb77a926f52f2756ed5872877ad8d73d018a426d44c6083d1ed972b1" "632694fd8a835e85bcc8b7bb5c1df1a0164689bc6009864faed38a9142b97057" "e2acbf379aa541e07373395b977a99c878c30f20c3761aac23e9223345526bcc" "fe94e2e42ccaa9714dd0f83a5aa1efeef819e22c5774115a9984293af609fce7" "3d3807f1070bb91a68d6638a708ee09e63c0825ad21809c87138e676a60bda5d" "6c3b5f4391572c4176908bb30eddc1718344b8eaff50e162e36f271f6de015ca" "dde8c620311ea241c0b490af8e6f570fdd3b941d7bc209e55cd87884eb733b0e" "912cac216b96560654f4f15a3a4d8ba47d9c604cbc3b04801e465fb67a0234f0" "bc836bf29eab22d7e5b4c142d201bcce351806b7c1f94955ccafab8ce5b20208" "54cf3f8314ce89c4d7e20ae52f7ff0739efb458f4326a2ca075bf34bc0b4f499" default))
;;  '(helm-completion-style 'emacs))
;; (custom-set-faces
;;  ;; custom-set-faces was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  )
;; (put 'projectile-ripgrep 'disabled nil)

;; ===============================================
;; keybindings
;; ===============================================

;; (use-package! winum
;;   :ensure t
;;   :config (map! :leader
;;         "0" 'winum-select-window-0-or-10
;;         "1" 'winum-select-window-1
;;         "2" 'winum-select-window-2
;;         "3" 'winum-select-window-3
;;         "4" 'winum-select-window-4
;;         "5" 'winum-select-window-5
;;         "6" 'winum-select-window-5
;;         "7" 'winum-select-window-7
;;         "8" 'winum-select-window-5
;;         "9" 'winum-select-window-9))

(setq user-full-name "Chris"
      user-mail-address "429354772@qq.com")
(setq confirm-kill-emacs nil)

(after! winum
  (map! :leader
        "0" 'winum-select-window-0-or-10
        "1" 'winum-select-window-1
        "2" 'winum-select-window-2
        "3" 'winum-select-window-3
        "4" 'winum-select-window-4
        "5" 'winum-select-window-5
        "6" 'winum-select-window-5
        "7" 'winum-select-window-7
        "8" 'winum-select-window-5
        "9" 'winum-select-window-9))

(setq doom-localleader-key ",")

(use-package! lsp-elixir
  :after lsp-mode
  :config (lsp-register-client
           (make-lsp-client
            :new-connection
            (lsp-stdio-connection
             (expand-file-name "~/elixir-ls/release/language_server.sh"))
            :major-modes '(elixir-mode)
            :priority -1
            :server-id 'elixir-ls
            :initialized-fn (lambda (workspace)
                              (with-lsp-workspace workspace
                                (let ((config `(:elixirLS (:mixEnv "dev" :dialyzerEnabled :json-false))))
                                  (lsp--set-configuration config)))))))

;; (load! "~/.doom.d/modules/spacemacs/+spacemacs")
;;

(map!
 "s-{" #'previous-buffer
 "s-}" #'next-buffer)

(after! clojure-mode
  (setq clojure-toplevel-inside-comment-form t))

(map! :mode clojure-mode
      :localleader
      "ef" 'cider-eval-defun-at-point
      "e;" 'cider-eval-defun-to-comment)

(map! :mode lsp-mode
      "s-p" 'lsp-signature-activate)


(map! :leader
      "v" 'er/expand-region
      "cl" 'evilnc-comment-or-uncomment-lines
      "qq" 'save-buffers-kill-emacs)

(map! :mode elixir-mode
      :localleader
      (:prefix "e"
       "l" #'alchemist-iex-send-current-line
       "b" #'alchemist-iex-compile-this-buffer
       "f" #'alchemist-iex-send-last-sexp
       "r" #'alchemist-iex-send-region
       "s" #'alchemist-iex-reload-module)
      (:prefix "s"
       "i" #'alchemist-iex-project-run
       ))

(defun eqyiel/json-minify ()
  "Minify the json at point."
  (interactive)
  (goto-char (point-min))
  (let* ((p (point))
         (json (json-read)))
    (delete-region p (point))
    (save-excursion
      (insert (json-encode json)))))

(map! :mode json-mode
      :localleader
      "m" #'eqyiel/json-minify)
