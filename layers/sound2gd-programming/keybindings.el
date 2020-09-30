;; 设置下elixir下的iex集成
(when (configuration-layer/layer-used-p 'elixir)
  (spacemacs/set-leader-keys-for-major-mode 'elixir-mode
    "si" #'alchemist-iex-project-run
    "el" #'alchemist-iex-send-current-line
    "eb" #'alchemist-iex-compile-this-buffer-and-go
    "ef" #'alchemist-iex-send-last-sexp
    "ec" #'alchemist-iex-command
    "er" #'alchemist-iex-send-region-and-go
    ))

(when (configuration-layer/layer-used-p 'lsp)
  (define-key evil-normal-state-map (kbd "gc") 'lsp-ui-doc-focus-frame)
  (define-key evil-normal-state-map (kbd "gv") 'lsp-ui-doc-unfocus-frame)
  )
