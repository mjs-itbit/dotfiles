;;;;
;;;; MISC
;;;;
;;;; [if found please return to damned@theworld.com]
;;;;
;;;; Modified Time-stamp: <2014-05-01 16:18:22 mjs>
;;;;
;; Save my place in files
(setq-default save-place t)
(after 'saveplace 
  (setq save-place-file (locate-user-emacs-file ".places")))

;; Save minibuffer history
(setq savehist-file (locate-user-emacs-file ".history"))

;; Backup files
(after 'files
  (setq version-control t
	delete-old-versions t
	backup-directory-alist 
	(acons "." (locate-user-emacs-file ".backups") nil)
	delete-by-moving-to-trash t
	trash-directory (expand-file-name "~/.Trash")))

;; time display the way i like it
(after 'time
  (setq display-time-24hr-format t 
	display-time-day-and-date t))

;; making sure all buffers are named uniquely
(after 'uniquify 
  (setq uniquify-after-kill-buffer-p t
	uniquify-buffer-name-style 'post-forward-angle-brackets))

(after 'ps-print
  (setq 
   ps-lpr-command (expand-file-name "~/bin/psprint")
   ps-spool-duplex t))

;; calendar
(after 'calendar 
  (setq 
   calendar-latitude +40.72541
   calendar-longitude -73.70928
   calendar-location-name "Floral Park, NY"
   calendar-time-display-form '(24-hours ":" minutes (if time-zone " (") time-zone (if time-zone ")"))
   diary-file "~/.diary"
   calendar-date-style 'european
   calendar-mark-diary-entries-flag t
   calendar-mark-holidays-flag t
   calendar-view-diary-initially-flag t
   calendar-view-holidays-initially-flag t))

;; Editing text
(after 'fill-column-indicator
  (setq fci-rule-color "red"))

(after 'battery 
  (setq battery-mode-line-format "[%b%p%% %t]"))

;; editing programs
(after 'simple
  (add-hook 'prog-mode-hook 'linum-mode)
  (add-hook 'prog-mode-hook 'turn-on-fci-mode))

;; auto-complete
(require 'auto-complete-config)
(ac-config-default)
(after 'auto-complete 
  (ac-ispell-setup)
  (setq ac-use-menu-map t))
(global-auto-complete-mode t)

(add-hook 'text-mode-hook 'ac-ispell-ac-setup)


;; abbrevs
(setq-default abbrev-mode t)

;; flyspell
(add-hook 'text-mode-hook 'flyspell-mode)

;; yasnippet
(after 'yasnippet
  (setq yas-prompt-functions 
	'(yas-ido-prompt yas-completing-prompt)))
(yas-global-mode 1)

(defun change-size (size)
  (interactive "nsize: ")
  (if (< size 100) (setq size (* 10 size)))
  (set-face-attribute 'default nil :height size))
(global-set-key (kbd "s-s") 'change-size)

(global-set-key (kbd "s-f") 'ace-jump-mode)

(global-set-key (kbd "C-=") 'er/expand-region)

(global-set-key (kbd "<f7>") 'magit-status)

(after 'coffee-mode
  (add-to-list 'ac-modes 'coffee-mode)
  (add-hook 'coffee-mode-hook 'whitespace-mode)
  (setq whitespace-style '(face empty indentation trailing)
	whitespace-action '(auto-cleanup warn-if-read-only))
  (setq coffee-tab-width 4))

(after 'markdown
  (setq markdown-command "markdown | smartypants"))

(after 'text
  (setq sentence-end-double-space nil))

(provide 'init-misc)
