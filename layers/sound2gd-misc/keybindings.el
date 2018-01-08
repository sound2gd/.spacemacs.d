
;; evil的normal和visual模式按下gf打开对应的文件
(define-key evil-normal-state-map (kbd "gf") 'sound2gd/open-file-at-cursor)
(define-key evil-visual-state-map (kbd "gf") 'sound2gd/open-file-at-cursor)

(require 'markdown-mode)
(define-key markdown-mode-map (kbd "<drag-n-drop>") 'md-dnd-func)
;; markdown写作时按下 ,p 直接将文件上传到七牛然后返回url地址插入到markdown里
(spacemacs/set-leader-keys-for-major-mode 'markdown-mode (kbd "p") 'sound2gd/upload-and-insert-image-from-clipbord)

(define-key evil-visual-state-map "R" 'evil-multiedit-match-all)
(define-key evil-normal-state-map (kbd "S-d") 'evil-multiedit-match-and-next)
(define-key evil-visual-state-map (kbd "S-d") 'evil-multiedit-match-and-next)
(define-key evil-normal-state-map (kbd "S-D") 'evil-multiedit-match-and-prev)
(define-key evil-visual-state-map (kbd "S-D") 'evil-multiedit-match-and-prev)
(define-key evil-visual-state-map (kbd "S-M-D") 'evil-multiedit-restore)
(define-key evil-normal-state-map (kbd "zz") 'evil-toggle-fold)
