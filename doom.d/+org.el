;;;  -*- lexical-binding: t; -*-

;; org-roam-ui
(use-package! websocket
  :after org-roam)

(use-package! org-roam-ui
  :after org-roam
  :config
  (setq org-roam-ui-sync-theme t
        org-roam-ui-follow t
        org-roam-ui-update-on-save t
        org-roam-ui-open-on-start t))

;; org table align
(use-package! valign
  :hook (org-mode . valign-mode)
  :config (setq valign-fancy-bar 'non-nil))

;; https://tecosaur.github.io/emacs-config/config.html#emphasis-markers
(use-package! org-appear
  :hook (org-mode . org-appear-mode)
  :config
  (setq org-appear-autoemphasis t
        org-appear-autosubmarkers t
        org-appear-autolinks nil)
  ;; for proper first-time setup, `org-appear--set-elements'
  ;; needs to be run after other hooks have acted.
  (run-at-time nil nil #'org-appear--set-elements))

;; https://tecosaur.github.io/emacs-config/config.html#heading-structure
(use-package! org-ol-tree
  :commands org-ol-tree)
(map! :map org-mode-map
      :after org
      :localleader
      :desc "Outline" "O" #'org-ol-tree)

(after! org
  ;; https://github.com/org-roam/org-roam/issues/2198
  (setq org-fold-core-style 'overlays)
  ;; https://tecosaur.github.io/emacs-config/config.html#font-display
  (custom-set-faces!
    '(outline-1 :weight extra-bold)
    '(outline-2 :weight bold)
    '(outline-3 :weight bold)
    '(outline-4 :weight semi-bold)
    '(outline-5 :weight semi-bold)
    '(outline-6 :weight semi-bold)
    '(outline-8 :weight semi-bold)
    '(outline-9 :weight semi-bold))
  (setq org-fontify-quote-and-verse-blocks t)

  (add-to-list 'org-capture-templates
               '("w" "Work todo" entry
                 (file+headline "work.org" "Inbox")
                 "* TODO %?" :prepend t :kill-buffer t)))

(defun locally-defer-font-lock ()
  "Set jit-lock defer and stealth, when buffer is over a certain size."
  (when (> (buffer-size) 50000)
    (setq-local jit-lock-defer-time 0.05
                jit-lock-stealth-time 1)))

(add-hook 'org-mode-hook #'locally-defer-font-lock)

(add-hook! 'org-mode-hook #'+org-pretty-mode #'mixed-pitch-mode)

(setq-default
 org-directory "~/Documents/org/"
 ;; org-journal
 org-journal-file-type 'weekly

 ;; run export processes in external emacs process
 org-export-in-background t

 org-ellipsis " ▾ "
 org-hide-leading-stars t

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
