;;;  -*- lexical-binding: t; -*-

(after! org
  (add-to-list 'org-capture-templates
               '("w" "Work todo" entry
                 (file+headline "work.org" "Inbox")
                 "* TODO %?" :prepend t :kill-buffer t))
  )

(setq-default
 org-directory "~/Documents/org/"
 ;; org-journal
 org-journal-file-type 'weekly

 ;; deft
 deft-directory "~/Documents/org/"
 deft-default-extension "org"
 deft-recursive t
 )
