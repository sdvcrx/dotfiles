;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-

(load! "+org")

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

 ;; modeline
 doom-modeline-buffer-file-name-style 'relative-to-project

 ;; tabs
 centaur-tabs-set-bar 'under
 x-underline-at-descent-line t
 centaur-tabs-height 32

 ;; evil
 ;; map jj to <ESC>
 evil-escape-key-sequence "jj"
 evil-escape-delay 0.3

 ;; lsp-eslint
 lsp-eslint-run "onSave"
 lsp-eslint-auto-fix-on-save t
 lsp-eslint-server-command
 `("node"
   ,(expand-file-name "~/.vscode-oss/extensions/dbaeumer.vscode-eslint-2.1.8/server/out/eslintServer.js")
   "--stdio")

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

 ;; enhance
 :n ";" 'evil-ex
 :n "C-/" 'swiper   ;; Ctrl+/

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

(after! centaur-tabs
  (defun centaur-tabs-hide-tab (x)
    "Do no to show buffer X in tabs."
    (let ((name (format "%s" x)))
      (or
       ;; Current window is not dedicated window.
       (window-dedicated-p (selected-window))

       ;; Buffer name not match below blacklist.
       (string-prefix-p "*epc" name)
       (string-prefix-p "*helm" name)
       (string-prefix-p "*Helm" name)
       (string-prefix-p "*Compile-Log*" name)
       (string-prefix-p "*lsp" name)
       (string-prefix-p "*company" name)
       (string-prefix-p "*Flycheck" name)
       (string-prefix-p "*tramp" name)
       (string-prefix-p " *Mini" name)
       (string-prefix-p "*help" name)
       (string-prefix-p "*straight" name)
       (string-prefix-p " *temp" name)
       (string-prefix-p "*Help" name)

       (string-prefix-p "*Org" name)
       (string-prefix-p "*org-roam" name)
       (string-prefix-p "*Messages" name)
       (string-prefix-p "*scratch" name)
       (string-prefix-p "*doom" name)
       (string-prefix-p "*tide-server" name)
       (string-prefix-p "*vls" name)

       ;; Is not magit buffer.
       (and (string-prefix-p "magit" name)
            (not (file-name-extension name)))
       )))
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

  (setq
   lsp-gopls-hover-kind "SingleLine"
   lsp-gopls-codelens nil
   lsp-gopls-use-placeholders nil)

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
  (setq
   lsp-vetur-validation-template nil
   lsp-vetur-completion-use-scaffold-snippets nil)

  ;; set emmet-expand to [tab] or Ctrl+e
  (map! :map emmet-mode-keymap
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
  (add-hook 'web-mode-hook 'custom-web-mode-hook))
