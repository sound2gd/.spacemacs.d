
;; 按下ss切换emacs的ss代理开关
(spacemacs|add-toggle toggle-shadowsocks-proxy-mode
  :status shadowsocks-proxy-mode
  :on (global-shadowsocks-proxy-mode)
  :off (global-shadowsocks-proxy-mode -1)
  :documentation "Toogle shadowsocks proxy mode"
  :evil-leader "ss")
