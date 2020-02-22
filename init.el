(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation nil
   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation nil
   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(
     better-defaults
     (colors :variables
             colors-enable-nyan-cat-progress-bar nil)
     ;; search-engine
     ;; (syntax-checking :variables syntax-checking-enable-by-default nil
     ;;   syntax-checking-enable-tooltips nil)
     ;; (spell-checking :variables spell-checking-enable-by-default nil)
     ;; (vinegar :variables vinegar-reuse-dired-buffer t)
     ;; (spacemacs-layouts :variables layouts-enable-autosave nil
     ;;   layouts-autosave-delay 300)
     (git :variables
          git-magit-status-fullscreen t
          magit-push-always-verify nil
          magit-save-repository-buffers 'dontask
          magit-revert-buffers 'silent
          magit-refs-show-commit-count 'all
          magit-revision-show-gravatars nil)
     (ibuffer :variables ibuffer-group-buffers-by 'projects)
     (auto-completion
      ;; (haskell :variables haskell-completion-backend 'intero)
      :variables auto-completion-enable-sort-by-usage t
      auto-completion-enable-snippets-in-popup t
      :disabled-for org markdown)
     (osx :variables osx-dictionary-dictionary-choice "Simplified Chinese - English"
          osx-command-as 'super)
     ;; (gtags :disabled-for clojure emacs-lisp javascript latex python shell-scripts)
     (shell :variables shell-default-shell 'eshell)
     (markdown :variables markdown-live-preview-engine 'vmd)
     (org :variables
          org-want-todo-bindings t
          org-enable-reveal-js-support t
          org-projectile-file "/Users/cris/Dropbox/gtd/gtd.org")
     yaml
     react
     (python :variables
             python-test-runner '(nose pytest))
     lua
     html
     javascript
     (typescript :variables
                 typescript-fmt-on-save nil
                 typescript-fmt-tool 'typescript-formatter)
     ;; racket
     emacs-lisp
     (clojure :variables
              clojure-enable-fancify-symbols t
              clojure-enable-clj-refactor t)
     (c-c++ :variables
            c-c++-default-mode-for-headers 'c++-mode
            c-c++-enable-clang-support t)
     (chinese :packages youdao-dictionary fcitx
              :variables chinese-enable-fcitx nil
              chinese-enable-youdao-dict t)
     go
     elixir
     asciidoc
     ;; (treemacs :variables
     ;;           treemacs-use-collapsed-directories 10
     ;;           treemacs-use-follow-mode nil
     ;;           treemacs-use-filewatch-mode nil)
     ;; (neotree)
     (rust :variables rust-backend 'lsp)
     ;; dap
     sound2gd
     (version-control :variables
                      version-control-diff-tool 'diff-hl
                      version-control-diff-side 'left)
     lsp
     (haskell :variables ;; Or optionally just haskell without the variables.
              haskell-completion-backend 'ghci
              haskell-process-type 'stack-ghci)
     (java :variables java-backend 'lsp)
                                        ; (haskell :variables ;; Or optionally just haskell without the variables.
                                        ; haskell-completion-backend 'intero
                                        ; haskell-enable-hindent-style "johan-tibell"
                                        ; haskell-completion-backend 'ghci
                                        ; haskell-process-type 'stack-ghci
                                        ; )
     ;; (scala :variables
     ;;   scala-indent:use-javadoc-style t
     ;;   scala-use-java-doc-style t
     ;;   scala-auto-insert-asterisk-in-comments t
     ;;   scala-use-unicode-arrows t
     ;;   scala-auto-start-ensime t
     ;;   )
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '(obsidian-theme
                                      gruvbox-theme
                                      material-theme
                                      zenburn-theme
                                      nord-theme
                                      nimbus-theme
                                      ssass-mode
                                      stylus-mode
                                      gandalf-theme
                                      srcery-theme
                                      doom-themes
                                      ;; all-the-icons
                                      ;; all-the-icons-dired
                                      string-inflection
                                      ibuffer-projectile
                                      carbon-now-sh
                                      (lsp-haskell :location (recipe :fetcher github :repo "emacs-lsp/lsp-haskell"))
                                      )
   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()
   dotspacemacs-excluded-packages '()
   ;; '(magit-gh-pulls magit-gitflow org-projectile evil-mc realgud
   ;;                  evil-args evil-ediff evil-exchange evil-unimpaired
   ;;                  evil-indent-plus volatile-highlights smartparens
   ;;                  spaceline holy-mode skewer-mode rainbow-delimiters
   ;;                  highlight-indentation vi-tilde-fringe eyebrowse
   ;;                  org-bullets smooth-scrolling org-repo-todo org-download org-timer
   ;;                  livid-mode git-gutter git-gutter-fringe  evil-escape
   ;;                  leuven-theme gh-md evil-lisp-state spray lorem-ipsum symon
   ;;                  ac-ispell ace-jump-mode auto-complete auto-dictionary
   ;;                  clang-format define-word google-translate disaster epic
   ;;                  fancy-battery org-present orgit orglue spacemacs-theme
   ;;                  helm-flyspell flyspell-correct-helm clean-aindent-mode
   ;;                  helm-c-yasnippet ace-jump-helm-line helm-make magithub
   ;;                  helm-swoop  smeargle
   ;;                  ido-vertical-mode flx-ido company-quickhelp counsel-projectile
   ;;                  window-purpose ivy-purpose helm-purpose spacemacs-purpose-popwin
   ;;                  )
   dotspacemacs-install-packages 'used-only
   dotspacemacs-delete-orphan-packages t))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil
   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'.
   dotspacemacs-elpa-subdirectory nil
   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'vim
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official
   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'."
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))
   ;; True if the home buffer should respond to resize events.
   dotspacemacs-startup-buffer-responsive t
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(spacemacs-dark srcery gruvbox)
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   dotspacemacs-default-font '(
                               "SF MONO"
                               ;; "Source Code Pro"
                               :size 17
                               :weight light
                               :width normal
                               :powerline-scale 1.1)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The key used for Emacs commands (M-x) (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"
   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; If non nil `Y' is remapped to `y$' in Evil states. (default nil)
   dotspacemacs-remap-Y-to-y$ t
   ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
   ;; there. (default t)
   dotspacemacs-retain-visual-state-on-shift t
   ;; If non-nil, J and K move lines up and down when in visual mode.
   ;; (default nil)
   dotspacemacs-visual-line-move-text t
   ;; If non nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
   ;; (default nil)
   dotspacemacs-ex-substitute-global nil
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; Controls fuzzy matching in helm. If set to `always', force fuzzy matching
   ;; in all non-asynchronous sources. If set to `source', preserve individual
   ;; source settings. Else, disable fuzzy matching in all sources.
   ;; (default 'always)
   dotspacemacs-helm-use-fuzzy 'always
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-transient-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; Control where `switch-to-buffer' displays the buffer. If nil,
   ;; `switch-to-buffer' displays the buffer in the current window even if
   ;; another same-purpose window is available. If non nil, `switch-to-buffer'
   ;; displays the buffer in a same-purpose window even if the buffer can be
   ;; displayed in the current window. (default nil)
   dotspacemacs-switch-to-buffer-prefers-purpose nil
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup t
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t
   ;; If non nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling nil
   ;; If non nil line numbers are turned on in all `prog-mode' and `text-mode'
   ;; derivatives. If set to `relative', also turns on relative line numbers.
   ;; (default nil)
   dotspacemacs-line-numbers nil
   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'origami
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `rg', `ag', `pt', `ack' and `grep'.
   ;; (default '("rg" "ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup 'changed
   ))
(defun dotspacemacs/user-init ()
  (setq configuration-layer-elpa-archives
        '(("melpa-cn" . "https://elpa.emacs-china.org/melpa/")
          ("org-cn"   . "https://elpa.emacs-china.org/org/")
          ("gnu-cn"   . "https://elpa.emacs-china.org/gnu/")))

  ;; https://github.com/syl20bnr/spacemacs/issues/2705
  ;; (setq tramp-mode nil)
  (setq tramp-ssh-controlmaster-options
        "-o ControlMaster=auto -o ControlPath='tramp.%%C' -o ControlPersist=no")

  ;; ss proxy. But it will cause anacond-mode failed.
  (setq socks-server '("Default server" "127.0.0.1" 1086 5))
  (setq evil-shift-round nil)
  (setq byte-compile-warnings '(not obsolete))
  (setq warning-minimum-level :error)
  (setq save-abbrevs nil)
  ;; hack for remove purpose mode
  ;; (setq purpose-mode nil)
  )

(defun dotspacemacs/user-config ()
  ;;==========================================================
  ;; 从山人的配置抄来的
  ;;==========================================================

  ;;解决org表格里面中英文对齐的问题
  ;; (when (configuration-layer/layer-usedp 'chinese)
  ;;   (when (and (spacemacs/system-is-mac) window-system)
  ;;     (spacemacs//set-monospaced-font "Source Code Pro" "Hiragino Sans GB" 16 16)))
  (setq split-width-threshold 120)
  ;; (linum-relative-on)
  (spacemacs|add-company-backends :modes text-mode)
  (global-hungry-delete-mode t)
  (spacemacs|diminish helm-gtags-mode)
  (spacemacs|diminish ggtags-mode)
  (spacemacs|diminish which-key-mode)
  (spacemacs|diminish spacemacs-whitespace-cleanup-mode)
  (spacemacs|diminish counsel-mode)
  ;;==========================================================

  ;; 从系统剪切板搞数据
  ;; (fset 'evil-visual-update-x-selection 'ignore)
  (setq yas-snippet-dirs
        '(
          "~/.spacemacs.d/snippets/"
          "~/.emacs.d/layers/+completion/auto-completion/local/snippets"))
  (setq yas-indent-line 'fixed)
  (yas-global-mode 1)
  (setq projectile-enable-caching t)
  ;; (setq frame-title-format '(:eval (lx/layouts-for-title-bar)))

  (setq racer-rust-src-path "/Users/cris/.rustup/toolchains/stable-x86_64-apple-darwin/lib/rustlib/src/rust/src")
  (setq ensime-startup-notification nil)

  (add-to-list 'exec-path "~/.local/bin/")
  (setq lsp-haskell-process-path-hie "hie")
  (require 'lsp-haskell)
  (add-hook 'haskell-mode-hook #'lsp)
  ;; (define-minor-mode
  ;;   shadowsocks-proxy-mode
  ;;   :global t
  ;;   :init-value nil
  ;;   :lighter " SS"
  ;;   (if shadowsocks-proxy-mode
  ;;     (setq url-gateway-method 'socks)
  ;;     (setq url-gateway-method 'native)))
  )

(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
  (custom-set-variables
   ;; custom-set-variables was added by Custom.
   ;; If you edit it by hand, you could mess it up, so be careful.
   ;; Your init file should contain only one such instance.
   ;; If there is more than one, they won't work right.
   '(centaur-tabs-mode t nil (centaur-tabs))
   '(evil-want-Y-yank-to-eol t)
   '(hl-todo-keyword-faces
     '(("TODO" . "#dc752f")
       ("NEXT" . "#dc752f")
       ("THEM" . "#2d9574")
       ("PROG" . "#4f97d7")
       ("OKAY" . "#4f97d7")
       ("DONT" . "#f2241f")
       ("FAIL" . "#f2241f")
       ("DONE" . "#86dc2f")
       ("NOTE" . "#b1951d")
       ("KLUDGE" . "#b1951d")
       ("HACK" . "#b1951d")
       ("TEMP" . "#b1951d")
       ("FIXME" . "#dc752f")
       ("XXX" . "#dc752f")
       ("XXXX" . "#dc752f")))
   '(package-selected-packages
     '(yaml-mode gruvbox-theme autothemer zenburn-theme youdao-dictionary yasnippet-snippets yapfify xterm-color ws-butler winum which-key web-mode web-beautify volatile-highlights vmd-mode vi-tilde-fringe uuidgen use-package unfill toml-mode toc-org tide tagedit symon stylus-mode string-inflection ssass-mode spaceline-all-the-icons smeargle slim-mode shell-pop scss-mode sass-mode rjsx-mode reveal-in-osx-finder restart-emacs ranger rainbow-mode rainbow-identifiers rainbow-delimiters racer pyvenv pytest pyenv-mode py-isort pug-mode prettier-js popwin pippel pipenv pip-requirements persp-mode pcre2el password-generator paradox ox-reveal overseer osx-trash osx-dictionary origami orgit org-projectile org-present org-pomodoro org-mime org-download org-bullets org-brain open-junk-file obsidian-theme ob-elixir nord-theme noflet nodejs-repl nimbus-theme neotree nameless mwim mvn multi-term move-text mmm-mode meghanada maven-test-mode material-theme markdown-toc magit-svn magit-gitflow macrostep lsp-haskell lorem-ipsum livid-mode live-py-mode link-hint launchctl json-navigator json-mode js2-refactor js-doc intero indent-guide importmagic impatient-mode ibuffer-projectile hungry-delete hlint-refactor hl-todo hindent highlight-parentheses highlight-numbers highlight-indentation helm-xref helm-themes helm-swoop helm-rtags helm-pydoc helm-purpose helm-projectile helm-org-rifle helm-mode-manager helm-make helm-hoogle helm-gitignore helm-git-grep helm-flx helm-descbinds helm-css-scss helm-company helm-c-yasnippet helm-ag haskell-snippets groovy-mode groovy-imports gradle-mode google-translate google-c-style golden-ratio godoctor go-tag go-rename go-impl go-guru go-gen-test go-fill-struct go-eldoc gnuplot gitignore-templates gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe git-gutter-fringe+ gh-md gandalf-theme fuzzy font-lock+ flycheck-mix flycheck-credo flx-ido fill-column-indicator fancy-battery eyebrowse expand-region evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-org evil-numbers evil-nerd-commenter evil-matchit evil-magit evil-lisp-state evil-lion evil-indent-plus evil-iedit-state evil-goggles evil-exchange evil-escape evil-ediff evil-cleverparens evil-args evil-anzu eshell-z eshell-prompt-extras esh-help ensime emmet-mode elisp-slime-nav editorconfig dumb-jump dotenv-mode doom-themes doom-modeline disaster dired-narrow diminish diff-hl dante cython-mode counsel-projectile company-web company-tern company-statistics company-rtags company-go company-ghci company-ghc company-emacs-eclim company-cabal company-c-headers company-anaconda column-enforce-mode color-identifiers-mode cmm-mode clojure-snippets clojure-cheatsheet clean-aindent-mode clang-format cider-eval-sexp-fu centered-cursor-mode cargo carbon-now-sh browse-at-remote auto-yasnippet auto-highlight-symbol auto-compile alchemist aggressive-indent adoc-mode ace-window ace-link ace-jump-helm-line ac-ispell))
   '(pdf-view-midnight-colors '("#b2b2b2" . "#292b2e"))
   '(safe-local-variable-values
     '((cider-ns-refresh-after-fn . "integrant.repl/resume")
       (cider-ns-refresh-before-fn . "integrant.repl/suspend")
       (typescript-backend . tide)
       (typescript-backend . lsp)
       (javascript-backend . tern)
       (javascript-backend . lsp)
       (go-backend . go-mode)
       (go-backend . lsp)
       (elixir-enable-compilation-checking . t)
       (elixir-enable-compilation-checking))))
  (custom-set-faces
   ;; custom-set-faces was added by Custom.
   ;; If you edit it by hand, you could mess it up, so be careful.
   ;; Your init file should contain only one such instance.
   ;; If there is more than one, they won't work right.
   '(diff-hl-change ((t (:background "#da8548" :foreground "#da8548"))))
   '(diff-hl-delete ((t (:background "#e45649" :foreground "#e45649"))))
   '(diff-hl-insert ((t (:background "#50a14f" :foreground "#50a14f")))))
  )
