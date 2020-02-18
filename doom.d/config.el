;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-

;; evil-snipe
(after! evil-snipe
  (evil-snipe-mode -1))

;; company
(after! company
  (setq-default
   company-idle-delay 0.3
   company-minimum-prefix-length 3))

;; flycheck
(after! flycheck
  (setq flycheck-idle-change-delay 5))

(after! yasnippet
  (push "~/.doom.d/templates" yas-snippet-dirs)
  (set-file-template! "\\.vue$" ':trigger "__.vue" :mode 'web-mode)
  (yas-reload-all)
  )

(after! web-mode
  (flycheck-add-mode 'javascript-eslint 'web-mode)
  (eslintd-fix)

  (defun custom-web-mode-hook ()
    "Hooks for Web mode."
    (setq
      web-mode-style-padding 0
      web-mode-script-padding 0
      )
    )
  (add-hook 'web-mode-hook  'custom-web-mode-hook)
  )

(setq-default
 user-full-name "sdvcrx"
 user-mail-address "me@sdvcrx.com"

 org-directory "~/Documents/org/"

 ;; evil
 ;; map jj to <ESC>
 evil-escape-key-sequence "jj"
 ;; evil-escape-delay 0.3
 ;; evil-escape-inhibit-functions '(evil-visual-state-p)

 ;; doom
 doom-localleader-key ","

 ;; font
 doom-font (font-spec :family "Source Code Pro" :size 15)
 doom-unicode-font (font-spec :family "Source Code Pro" :size 15)

 ;; elpa
 package-archives
 '(("melpa-cn" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")
   ("org-cn"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/org/")
   ("gnu-cn"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/"))
)

;; keybindings
(map!
 ;; Easier window navigation
 :n "C-h"   #'evil-window-left
 :n "C-j"   #'evil-window-down
 :n "C-k"   #'evil-window-up
 :n "C-l"   #'evil-window-right

 ;; Override C-w delete-word
 :gi "C-w" #'evil-delete-backward-word

 (:leader
   (:prefix "f"
     :desc "Save buffer" :n "s" #'save-buffer
     :desc "Save all buffers" :n "S" #'evil-write-all)
   (:prefix "b"
     :desc "Kill buffer" :n "d" #'doom/kill-this-buffer-in-all-windows)
   (:prefix "g"
     :desc "Magit dispatch" :n "m" #'magit-dispatch-popup)
   )
 )

(after! go-mode
  (map! :map go-mode-map
        :localleader
        (:prefix ("i" . "imports")
          "i" #'go-import-add
          "a" #'go-import-add
          "r" #'go-remove-unused-imports
          "g" #'go-goto-imports)))
