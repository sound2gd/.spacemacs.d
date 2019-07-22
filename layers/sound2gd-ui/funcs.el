(defun memacs/define-evil-normal-keybinding (key def &rest bindings)
  "Binding keys and func for normal state map and motion state map"
  (while key
    (define-key evil-normal-state-map (kbd key) def)
    (define-key evil-motion-state-map (kbd key) def)
    (setq key (pop bindings) def (pop bindings)))
  )
