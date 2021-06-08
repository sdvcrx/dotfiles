;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-

(load! "+org")
(load! "+chinese")
(load! "+extra")

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
          '(right . 0)
          '(bottom . 0))

(setq-default
 user-full-name "sdvcrx"
 user-mail-address "me@sdvcrx.com"

 ;; modeline
 doom-modeline-buffer-file-name-style 'relative-to-project

 ;; treemacs theme
 doom-themes-treemacs-theme "doom-colors"

 history-length 1000
 prescient-history-length 1000

 ;; tabs
 centaur-tabs-set-bar 'over
 centaur-tabs-set-icons t
 centaur-tabs-gray-out-icons 'buffer
 centaur-tabs-height 24
 centaur-tabs-set-modified-marker t
 centaur-tabs-style "bar"
 centaur-tabs-modified-marker "•"

 +ligatures-extras-in-modes '(org-mode)

 ;; evil
 ;; map jj to <ESC>
 evil-escape-key-sequence "jj"
 evil-escape-delay 0.3
 evil-want-fine-undo t

 scroll-margin 2

 ;; lsp-ui
 lsp-ui-sideline-enable nil
 lsp-ui-sideline-show-hover nil

 ;; doc
 ;; lsp-ui-doc-enable nil
 lsp-ui-doc-show-with-cursor nil
 ;; lsp-ui-doc-show-with-mouse nil

 ;; lsp-eslint
 lsp-eslint-run "onSave"
 lsp-eslint-auto-fix-on-save t

 ;; doom
 doom-localleader-key ","
 doom-localleader-alt-key "M-,")

;; font
;; yay -S ttf-jetbrains-mono
(setq font-size 18)
;; 4K => base-font-size * 2
(when (>= (display-pixel-width) 3840)
  (setq font-size (* font-size 2)))

(setq
 doom-themes-enable-bold t
 doom-themes-enable-italic t

 ;; doom-serif-font (font-spec :family "IBM Plex Mono" :weight 'light)
 doom-font (font-spec :family "JetBrains Mono" :size font-size)
 doom-unicode-font (font-spec :family "JetBrains Mono"))

;; https://github.com/laishulu/Sarasa-Mono-SC-Nerd
(when (find-font (font-spec :name "Sarasa Mono SC Nerd"))
  (setq
   ;; doom-variable-pitch-font (font-spec :family "Sarasa Mono SC Nerd")
   doom-variable-pitch-font (font-spec :family "JetBrains Mono")
   doom-big-font (font-spec :family "Sarasa Mono SC Nerd" :size (* font-size 1.5))
   doom-unicode-font (font-spec :family "Sarasa Mono SC Nerd")))

;; modeline
;; Copy from https://tecosaur.github.io/emacs-config/config.html#theme-modeline
(defun doom-modeline-conditional-buffer-encoding ()
  "We expect the encoding to be LF UTF-8, so only show the modeline when this is not the case"
  (setq-local doom-modeline-buffer-encoding
              (unless (and (memq (plist-get (coding-system-plist buffer-file-coding-system) :category)
                                 '(coding-category-undecided coding-category-utf-8))
                           (not (memq (coding-system-eol-type buffer-file-coding-system) '(1 2))))
                t)))

(add-hook 'after-change-major-mode-hook #'doom-modeline-conditional-buffer-encoding)

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

 (:when (featurep! :ui tabs)
  :g "M-h" #'centaur-tabs-backward
  :g "M-l" #'centaur-tabs-forward)

 (:leader
   (:prefix "f"
     :desc "Save buffer" :n "s" #'save-buffer
     :desc "Save all buffers" :n "S" #'evil-write-all)
   (:prefix "b"
     :desc "Kill buffer" :n "d" #'doom/kill-this-buffer-in-all-windows)
   (:prefix "g"
    :desc "Magit dispatch" :n "m" #'magit-dispatch-popup)
   :desc "Org roam" "r" (general-simulate-key "SPC n r")))

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
