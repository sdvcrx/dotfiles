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

;; set initial frame size
(pushnew! initial-frame-alist
          '(width . 85)
          '(height . 40)
          '(left . 0)
          '(bottom . 0))

(setq-default
 user-full-name "sdvcrx"
 user-mail-address "me@sdvcrx.com"

 org-directory "~/Documents/org/"

 ;; modeline
 doom-modeline-buffer-file-name-style 'relative-to-project

 ;; evil
 ;; map jj to <ESC>
 evil-escape-key-sequence "jj"
 evil-escape-delay 0.2

 ;; doom
 doom-localleader-key ","

 ;; font
 ;; yay -S ttf-jetbrains-mono
 doom-font (font-spec :family "JetBrains Mono" :size 17)
 doom-unicode-font (font-spec :family "JetBrains Mono" :size 17)

 ;; elpa
 package-archives
 '(("melpa" . "https://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")
   ("org"   . "https://mirrors.tuna.tsinghua.edu.cn/elpa/org/")
   ("gnu"   . "https://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/"))
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

;;
;; language spec keybindings
;;

;; golang
(after! go-mode
  ;; Format on save
  ;; https://github.com/hlissner/doom-emacs/issues/1652#issuecomment-589408965
  ;; (add-to-list '+format-on-save-enabled-modes 'go-mode t)
  (add-hook! 'go-mode-hook
    (add-hook 'before-save-hook #'lsp-format-buffer nil 'local)
    (add-hook 'before-save-hook #'lsp-organize-imports nil 'local))

  (map! :map go-mode-map
        :localleader
        "i" nil
        (:prefix ("i" . "imports")
          "i" #'go-import-add
          "a" #'go-import-add
          "r" #'go-remove-unused-imports
          "g" #'go-goto-imports)))

;; vue / FE
(after! web-mode
  (flycheck-add-mode 'javascript-eslint 'web-mode)
  (eslintd-fix)

  ;; set emmet-expand to [tab] or Ctrl+e
  (map! :map emmet-mode-keymap
        :i [tab] #'emmet-expand-line
        :i "C-e" #'emmet-expand-line
        :i "C-j" #'emmet-next-edit-point
        :i "C-k" #'emmet-prev-edit-point)

  ;; set vue style/script indent to 0
  (defun custom-web-mode-hook ()
    "Hooks for Web mode."
    (setq
      web-mode-style-padding 0
      web-mode-script-padding 0
      )
    )
  (add-hook 'web-mode-hook  'custom-web-mode-hook))
