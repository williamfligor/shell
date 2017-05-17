(setq jsx-packages
    '(
      web-mode
      js2-mode
      company
      company-tern
      flycheck
      tern-mode
      ))
 
(setq jsx-excluded-packages '())

(defun jsx/init-js2-mode ()
  (require 'js2-mode)
  
  (js2-mode-hide-warnings-and-errors))

(defun jsx/init-flycheck ()
  (require 'flycheck)
  ;; use eslint with web-mode for jsx files
  (flycheck-add-mode 'javascript-eslint 'web-mode)
  (flycheck-add-mode 'javascript-eslint 'js2-mode)
 
  ;; disable jshint since we prefer eslint checking
  (setq-default flycheck-disabled-checkers
                (append flycheck-disabled-checkers
                        '(javascript-jshint)))
 
  ;; disable json-jsonlist checking for json files
  (setq-default flycheck-disabled-checkers
                (append flycheck-disabled-checkers
                        '(json-jsonlist))))
 
(defun jsx/init-web-mode ()
  (require 'web-mode)
  (add-to-list 'auto-mode-alist '("\\.jsx\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.react.js\\'" . web-mode))
 
  (add-hook 'web-mode-hook
            (lambda ()
              (if (equal web-mode-content-type "javascript")
                  (web-mode-set-content-type "jsx"))))
 
  (add-hook 'web-mode-hook
            (lambda ()
              (when (equal web-mode-content-type "jsx")
                (tern-mode)
                (js2-minor-mode))))

  )

(when (configuration-layer/layer-usedp 'auto-completion)
  (defun javascript/post-init-company ()
    (spacemacs|add-company-hook js2-mode))

  (defun javascript/init-company-tern ()
    (use-package company-tern
      :if (and (configuration-layer/package-usedp 'company)
               (configuration-layer/package-usedp 'tern))
      :defer t
      :init
      (push 'company-tern company-backends-js2-mode)))) 
