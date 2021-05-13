;;;  -*- lexical-binding: t; -*-

(use-package! valign
  :hook (org-mode . valign-mode)
  :config (setq valign-fancy-bar 'non-nil))

;; https://tecosaur.github.io/emacs-config/config.html#font-display
(use-package! org-appear
  :hook (org-mode . org-appear-mode)
  :config
  (setq org-appear-autoemphasis t
        org-appear-autosubmarkers t
        org-appear-autolinks nil)
  ;; for proper first-time setup, `org-appear--set-elements'
  ;; needs to be run after other hooks have acted.
  (run-at-time nil nil #'org-appear--set-elements))

(after! org
  (add-to-list 'org-capture-templates
               '("w" "Work todo" entry
                 (file+headline "work.org" "Inbox")
                 "* TODO %?" :prepend t :kill-buffer t))
  )

(add-hook! 'org-mode-hook #'+org-pretty-mode #'mixed-pitch-mode)

(setq-default
 org-directory "~/Documents/org/"
 ;; org-journal
 org-journal-file-type 'weekly

 ;; deft
 deft-directory "~/Documents/org/"
 deft-default-extension "org"
 deft-recursive t
 )

;; Prettify org-roam modeline filename
;; https://tecosaur.github.io/emacs-config/config.html#modeline-file-name
(defadvice! doom-modeline--buffer-file-name-roam-aware-a (orig-fun)
  :around #'doom-modeline-buffer-file-name ; takes no args
  (if (s-contains-p org-roam-directory (or buffer-file-name ""))
      (replace-regexp-in-string
       "\\(?:^\\|.*/\\)\\([0-9]\\{4\\}\\)\\([0-9]\\{2\\}\\)\\([0-9]\\{2\\}\\)[0-9]*-"
       "(\\1-\\2-\\3) "
       (subst-char-in-string ?_ ?  buffer-file-name))
    (funcall orig-fun)))
