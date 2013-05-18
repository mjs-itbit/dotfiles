;;;;
;;;; Lisp setup
;;;;
;;;; [if found please return to damned@theworld.com]
;;;;
;;;; Modified Time-stamp: <2013-05-18 12:09:53 mark>
;;;;
(after 'lisp-mode
  (add-hook 'emacs-lisp-mode-hook 'paredit-mode)
  (add-hook 'emacs-lisp-mode-hook 'rainbow-delimiters-mode)
  (add-hook 'emacs-lisp-mode-hook 'turn-on-eldoc-mode)

  (add-hook 'lisp-mode-hook 'paredit-mode)
  (add-hook 'lisp-mode-hook 'rainbow-delimiters-mode)
  (add-hook 'lisp-interaction-mode-hook 'turn-on-eldoc-mode)

  (after 'ielm
    (add-hook 'ielm-mode-hook 'turn-on-eldoc-mode)))

(after 'scheme
  (add-hook 'scheme-mode-hook 'paredit-mode)
  (add-hook 'scheme-mode-hook 'rainbow-delimiters-mode))

(after 'clojure-mode 
  (add-hook 'clojure-mode-hook 'paredit-mode)
  (add-hook 'clojure-mode-hook 'rainbow-delimiters-mode))

(after 'nrepl
  (add-hook 'nrepl-mode-hook 'subword-mode)
  (add-hook 'nrepl-mode-hook 'paredit-mode)
  (add-hook 'nrepl-mode-hook 'rainbow-delimiters-mode)
  (add-hook 'nrepl-interaction-mode 'nrepl-turn-on-eldoc-mode)
  (setq nrepl-popup-stacktraces nil))



(provide 'init-lisp)
