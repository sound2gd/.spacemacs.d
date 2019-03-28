
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

(define-key evil-normal-state-map (kbd "s-=") 'text-scale-increase)
(define-key evil-visual-state-map (kbd "s-=") 'text-scale-increase)
(define-key evil-insert-state-map (kbd "s-=") 'text-scale-increase)
(define-key evil-normal-state-map (kbd "s--") 'text-scale-decrease)
(define-key evil-visual-state-map (kbd "s--") 'text-scale-decrease)
(define-key evil-insert-state-map (kbd "s--") 'text-scale-decrease)

;; 高亮当前光标下的东东
(spacemacs/set-leader-keys
  (kbd "hh") 'highlight-symbol-at-point
  (kbd "hc") 'hi-lock-unface-buffer
  ;; 有道词典查询
  (kbd "oy") 'youdao-dictionary-search-at-point+)
