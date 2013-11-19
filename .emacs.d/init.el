;;;; .emacs.el
;;;;
;;;; [if found please return to damned@theworld.com]
;;;;
;;;; Modified Time-stamp: <2013-11-17 19:13:59 mark>
;;;;

;;; 
;;; First Things First
;;;
(require 'cl)		

;; make sure the display is clean to start with
(when (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(when (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(when (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(setq inhibit-splash-screen t
      inhibit-startup-echo-area-message "damned")

;; cute little wrapper around eval-after-load
(defmacro after (mode &rest body)
  "`eval-after-load' MODE evaluate BODY."
  (declare (indent defun))
  `(eval-after-load ,mode
     '(progn ,@body)))

;;;
;;; Customize
;;;
;; I want to keep the customize stuff out of this config file.  I
;; don't use customize for much so I don't generally want to see it.
(setq custom-file (locate-user-emacs-file "init-custom.el"))
(load-file custom-file)

;;;
;;; Package
;;;
(require 'package)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives 
	     '("marmalade" . "http://marmalade-repo.org/packages/") 
	     :append)
(package-initialize)

;;;
;;; Exec Path
;;;
(add-to-list 'exec-path "/usr/local/bin")
(add-to-list 'exec-path "/Users/mark/Bin")
(add-to-list 'exec-path "/usr/texbin" :append)
(setenv "PATH" (mapconcat 'identity exec-path ":"))

;;;
;;; Load Path
;;;
(add-to-list 'load-path user-emacs-directory)
(add-to-list 'load-path (locate-user-emacs-file "lisp"))

;;;
;;; Auto-mode-alist additions
;;;
(add-to-list 'auto-mode-alist '("\\.md$" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown$" . markdown-mode))

;;;
;;; Exterinalized config of specific things
;;;
(require 'init-bbdb)
(require 'init-mail)
(require 'init-gnus)
(require 'init-latex)
(require 'init-ido)
(require 'init-org)
(require 'init-lisp)
(require 'init-misc)

(global-set-key [?\s-p] 'ps-print-buffer)

;;;
;;; turn on all things that need turning on.
;;;
;(display-battery-mode)
(display-time)
(server-start)
(show-paren-mode)
(global-hl-line-mode)
(savehist-mode)

;; ido mode
(ido-mode)
(ido-everywhere)
(ido-ubiquitous)

;; setup midnight hooks
(require 'midnight)
(timer-activate midnight-timer)

(require 'uniquify)
(require 'saveplace)

;; setup miniedit - multi-line editing of the mini-buffer
(require 'miniedit)
(miniedit-install)

;; turn on the column indicator
(setq fill-column 78)
(add-hook 'text-mode-hook 'turn-on-fci-mode)

;; Update timestamps in file on save
(add-hook 'before-save-hook 'time-stamp)
