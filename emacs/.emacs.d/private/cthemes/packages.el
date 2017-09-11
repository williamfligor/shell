(setq cthemes-packages
  '(
    hc-zenburn-theme
    ))

;; define programmatically the init functions
(dolist (pkg cthemes-packages)
  (eval `(defun ,(intern (format "cthemes/init-%S" pkg)) nil)))
