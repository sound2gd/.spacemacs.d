(defun sound2gd/fix-clj-edn-deps ()
  "function for working properly with clj command line tool, make cider and projectile recongnize a project with deps.edn correctly"
  (interactive)
  (projectile-register-project-type
   'clojure '("deps.edn")
   :compile "clj"
   :run "clj -i ~/.clojure/init.clj -r")
  (when (not (some (lambda (ele) (equal ele "deps.edn"))
                   clojure-build-tool-files))
    (add-to-list 'clojure-build-tool-files "deps.edn")))
(defun sound2gd/start-depns-based-repl-server ()
  "starts a nrepl server based on clj commandline tool"
  (interactive)
  (when (file-exists-p
         (concat (file-name-directory buffer-file-name)
                 "deps.edn"))
    ;; 项目路径下deps.edn文件存在的时候才启动nrepl-server
    (call-process-shell-command "/usr/local/bin/clj -i ~/.clojure/init.clj -r")))

;; 用py来格式化json
(defun sound2gd/py-beautify-json ()
  (interactive)
  (let ((b (if mark-active (min (point) (mark)) (point-min)))
        (e (if mark-active (max (point) (mark)) (point-max))))
    (shell-command-on-region b e "python -mjson.tool" (current-buffer) t)))


(add-to-list 'auto-mode-alist (cons (concat "\\." (regexp-opt
                                                   '("xml"
                                                     "xsd"
                                                     "rng"
                                                     "xslt"
                                                     "xsl")
                                                   t) "\\'") 'nxml-mode))


(setq nxml-slash-auto-complete-flag t)


(when (configuration-layer/layer-used-p 'lsp)
  (message "sound2gd-config-lsp: idle-delay -> 0.5, read-process-output-max 3M")
  (setq read-process-output-max (* 3 1024 1024)) ;; 3mb
  (setq lsp-idle-delay 0.500)
  (setq lsp-ui-doc-position 'at-point)
  )
