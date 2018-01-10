(defun sound2gd/open-treemacs-and-find-file ()
  (interactive)
  (let ((current-window (winum-get-number)))
    (treemacs-projectile-toggle)
    (when (string-equal (buffer-name) treemacs--buffer-name)
      ;; 当前在treemacs buffer里,跳转到当前window
      (winum-select-window-by-number current-window)
      ;; 寻找文件
      (treemacs-find-file)
      (winum-select-window-1)
      )))

(defun sound2gd//path-at-cursor ()
  "获取当前光标下的路径"
  (if (use-region-p) ;; 如果有选中
      (buffer-substring-no-properties (region-beginning) (region-end))
    ;; 无选中
    (let ($p0 $p1 $p2 ($pathStops "^  \t\n\"`'‘’“”|()[]{}「」<>〔〕〈〉《》【】〖〗«»‹›❮❯❬❭·。\\"))
      (setq $p0 (point))
      (skip-chars-backward $pathStops)
      (setq $p1 (point))
      (goto-char $p0)
      (skip-chars-forward $pathStops)
      (setq $p2 (point))
      (goto-char $p0)
      (buffer-substring-no-properties $p1 $p2)
      )))

(defun sound2gd/open-file-at-cursor ()
  "打开光标下的文件"
  (interactive)
  (let* (($inputStr (sound2gd//path-at-cursor))
         ($path (replace-regexp-in-string "^file:///" "/" (replace-regexp-in-string "://'" "" $inputStr))))
    (message "当前获取到path: %s" $path)
    (if (string-match-p "\\`https?://" $path) (browse-url $path)
      (progn
        (if (string-match "^\\`\\(.+?\\):\\([0-9]+\\)\\'" $path)
            (let (($fpath (match-string 1 $path))
                  ($line-num (string-to-number (match-string 2 $path))))
              (if (file-exists-p $fpath)
                  (progn
                    (find-file $fpath)
                    (goto-char 1)
                    (forward-line (1- $line-num)))
                (when (y-or-n-p (format "文件: 「%s」不存在. 是否创建?" $fpath))
                  (find-file $fpath))))
          (if (file-exists-p $path)
              (find-file $path)
            (when (y-or-n-p (format "文件: 「%s」不存在. 是否创建?" $path))
              (find-file $path))))))))

(defun sound2gd/upload-and-insert-image-from-clipbord ()
  "从剪切板抓出图片数据，保存到临时目录，然后上传到七牛，最后插入链接"
  (interactive)
  (let* ((tmpDir "~/.qiniu/tmpFile/")
         (filename (format-time-string "%Y/%m/%d/%Y%m%d%H%M%S.png" (current-time)))
         (absolute-file-name (concat tmpDir filename)))
    ;; 创建文件夹
    (call-process-shell-command (format "mkdir -p %s/%s" tmpDir "$(date +%Y/%m/%d)"))
    ;; 复制剪切板数据到临时文件
    (call-process-shell-command (format "/usr/local/bin/pngpaste %s" absolute-file-name))
    (call-process-shell-command (format "/usr/local/bin/qshell fput blog %s %s" filename absolute-file-name))
    (insert (format "![](http://7xox4k.com1.z0.glb.clouddn.com/%s)" filename))
    ))

(defun md-dnd-func (event)
  "拖拽上传文件到七牛，返回七牛链接,并插入当前markdown buffer"
  (interactive "e")
  (goto-char (nth 1 (event-start event)))
  (x-focus-frame nil)
  (let* ((payload (car (last event)))
         (type (car payload))
         (fname (cadr payload))
         (name (nth 0 (last (split-string fname "/"))))
         (img-regexp "\\(gif\\|png\\|jp[e]?g\\)\\>")
         (localBaseDir "~/.qiniu/tmpFile/")
         (realFilename (concat (format-time-string "%Y/%m/%d/" (current-time)) name))
         (localFileDir (concat localBaseDir "$(date +%Y/%m/%d)" "/"))
         )
    (cond
     ;; insert image link
     ((and  (eq 'drag-n-drop (car event))
            (eq 'file type)
            (string-match img-regexp fname))
      (call-process-shell-command (concat "mkdir -p " localFileDir) )
      (call-process-shell-command (format "cp %s %s" fname localFileDir))
      (call-process-shell-command (format "/usr/local/bin/qshell fput blog %s %s"
                                          realFilename (concat localFileDir name)))
      (insert (format "![](http://7xox4k.com1.z0.glb.clouddn.com/%s)" realFilename))
      (beginning-of-line)
      (forward-char 2))
     ;; regular drag and drop on file
     ((eq 'file type)
      (insert (format "[[%s]]\n" fname)))
     (t
      (error "I am not equipped for dnd on %s" payload)))))


;; https://blog.lojic.com/2009/08/06/send-growl-notifications-from-carbon-emacs-on-osx/
;; 一个用来发osx通知的脚本,需要先安装growl
(defun sound2gd/growl-notification (title message &optional sticky)
  "Send a Growl notification"
  (do-applescript
   (format "tell application \"GrowlHelperApp\" \n
              notify with name \"Emacs Notification\" title \"%s\" description \"%s\" application name \"Emacs.app\" sticky \"%s\"
              end tell"
           title
           message
           (if sticky "yes" "no"))))
