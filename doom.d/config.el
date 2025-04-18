;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-

(load! "+org")
(load! "+chinese")
(load! "+extra")
(when (featurep :system 'macos)
  (load! "+macos"))

;; evil-snipe
(remove-hook 'doom-first-input-hook #'evil-snipe-mode)

;; company
(after! company
  (setq-default
   company-idle-delay 0.3
   company-minimum-prefix-length 3))

(after! corfu
  (setq-default
   +corfu-want-tab-prefer-navigating-org-tables t
   corfu-auto-delay 0.3
   corfu-auto-prefix 3
   corfu-preselect 'directory))

;; flycheck
(after! flycheck
  ;; https://www.flycheck.org/en/latest/user/syntax-checks.html#variable-flycheck-check-syntax-automatically
  (setq flycheck-check-syntax-automatically '(mode-enabled save))
  (setq flycheck-idle-change-delay 5))

(after! doom-modeline
  (remove-hook! doom-modeline-mode
    #'size-indication-mode
    #'column-number-mode)
  (line-number-mode -1))

;; (after! yasnippet
;;   (push "~/.doom.d/templates" yas-snippet-dirs)
;;   (set-file-template! "\\.vue$" ':trigger "__.vue" :mode 'web-mode)
;;   (yas-reload-all)
;;   )

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
 doom-modeline-major-mode-icon t
 doom-modeline-percent-position nil
 doom-modeline-time nil
 doom-modeline-env-version nil

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

 ;; ligatures
 +ligatures-extras-in-modes '(org-mode)

 ;; evil
 ;; map jj to <ESC>
 evil-escape-key-sequence "jj"
 evil-escape-delay 0.3
 evil-want-fine-undo t
 ;;  s/../.. to by global by default
 evil-ex-substitute-global t

 ;; which-key
 which-key-idle-delay 0.5

 scroll-margin 5

 ;; lsp company
 ;; don't show lsp completion with yasnippet
 +lsp-company-backends 'company-capf

 ;; LSP debug
 ;; lsp-log-io t

 ;; lsp-ui
 lsp-ui-sideline-enable nil
 lsp-ui-sideline-show-hover nil
 lsp-lens-enable nil
 lsp-modeline-code-actions-enable nil
 ;; show lsp-ui-doc on mouseover
 lsp-ui-doc-show-with-mouse t

 lsp-modeline-diagnostics-enable nil
 ;; ;; disable API doc
 ;; lsp-signature-render-documentation nil

 ;; lsp-eslint
 lsp-eslint-run "onSave"
 lsp-eslint-auto-fix-on-save t

 ;; lsp vue
 lsp-typescript-suggest-auto-imports nil
 lsp-clients-typescript-log-verbosity nil

 lsp-volar-take-over-mode t

 ;; lsp-enable-indentation nil

 ;; https://emacs-lsp.github.io/lsp-mode/page/performance/#use-plists-for-deserialization
 lsp-use-plists t

 ;; lsp typescript
 lsp-clients-typescript-log-verbosity nil

 ;; CJK word wrap
 word-wrap-by-category t

 ;; doom
 doom-localleader-key ","
 doom-localleader-alt-key "M-,")

;; font
;; yay -S ttf-jetbrains-mono
(setq font-size 18)
;; 4K => base-font-size * 2
(when (>= (car (last (frame-monitor-geometry))) 2160)
  (setq font-size (* font-size 2)))

(setq
 doom-themes-enable-bold t
 doom-themes-enable-italic t

 ;; doom-serif-font (font-spec :family "IBM Plex Mono" :weight 'light)
 doom-font (font-spec :family "JetBrains Mono" :size font-size)
 doom-symbol-font (font-spec :family "JetBrains Mono"))

;; https://github.com/laishulu/Sarasa-Term-SC-Nerd
(when (doom-font-exists-p "Sarasa Term SC Nerd")
  (setq
   ;; doom-variable-pitch-font (font-spec :family "Sarasa Term SC Nerd")
   doom-variable-pitch-font (font-spec :family "JetBrains Mono")
   doom-big-font (font-spec :family "Sarasa Term SC Nerd" :size (* font-size 1.5))
   doom-symbol-font (font-spec :family "Sarasa Term SC Nerd")))

;; modeline
;; Copy from https://tecosaur.github.io/emacs-config/config.html#file-encoding
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
 :i "C-v" #'yank
 :i "M-v" #'yank

 ;; Override C-w delete-word
 :gi "C-w" #'evil-delete-backward-word

 (:when (modulep! :ui tabs)
  :g [backtab] #'centaur-tabs-backward
  :g "M-h" #'centaur-tabs-backward
  :n "TAB" #'centaur-tabs-forward
  :n [tab] #'centaur-tabs-forward
  :g "M-l" #'centaur-tabs-forward)

 (:leader
  :desc "Previous buffer"             "["   #'centaur-tabs-backward
  :desc "Next buffer"                 "]"   #'centaur-tabs-forward

   (:prefix "f"
     :desc "Save buffer" :n "s" #'save-buffer
     :desc "Save all buffers" :n "S" #'evil-write-all)
   (:prefix "b"
    (:when (modulep! :ui tabs)
     :desc "Previous buffer"             "["   #'centaur-tabs-backward
     :desc "Next buffer"                 "]"   #'centaur-tabs-forward)
     :desc "Kill buffer"                 "d" #'doom/kill-this-buffer-in-all-windows)
   (:prefix "g"
    :desc "Magit dispatch" :n "m" #'magit-dispatch-popup)
   (:prefix-map ("n" . "notes")
    (:when (modulep! :lang org +roam2)
     (:prefix ("r" . "roam")
      :desc "Search org roam"              "s" #'+default/org-roam-search
      )))
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
       (string-prefix-p " *which" name)
       (string-prefix-p "*Compile-Log*" name)
       (string-prefix-p "*lsp" name)
       (string-prefix-p "*LSP" name)
       (string-prefix-p "*company" name)
       (string-prefix-p "*Flycheck" name)
       (string-prefix-p "*tramp" name)
       (string-prefix-p " *Mini" name)
       (string-prefix-p "*help" name)
       (string-prefix-p "*straight" name)
       (string-prefix-p " *temp" name)
       (string-prefix-p "*Help" name)
       (string-prefix-p "*mybuf" name)

       (string-prefix-p "*Org" name)
       (string-prefix-p "*org-roam" name)
       (string-prefix-p "*Messages" name)
       (string-prefix-p "*scratch" name)
       (string-prefix-p "*doom" name)
       (string-prefix-p "*tide-server" name)
       (string-prefix-p "*vls" name)

       ;; dap
       (string-prefix-p "*dap-ui" name)

       ;; mu4e
       (string-prefix-p "*Article" name)
       (string-prefix-p "*mu4e" name)

       ;; magit
       (string-prefix-p "magit" name)
       (string-prefix-p "*compilation" name)
       )))
  )

(after! magit
  (setq
   magit-process-apply-ansi-colors t
   magit-section-initial-visibility-alist '((untracked . hide) (stashes . hide))))

(after! projectile
  (add-to-list 'projectile-globally-ignored-directories "^\.go/pkg$"))

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
          "g" #'go-goto-imports)
        (:prefix ("t" . "tests")
         "v" #'+go/test-single-verbose)))

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

  (setq-hook! 'web-mode-hook +format-with-lsp nil)

  ;; set vue style/script indent to 0
  (defun custom-web-mode-hook ()
    "Hooks for Web mode."
    (setq
     web-mode-style-padding 0
     web-mode-script-padding 0))

  ;; https://github.com/editorconfig/editorconfig-emacs#editorconfig-after-apply-functions
  ;; https://github.com/editorconfig/editorconfig-emacs/issues/79
  (add-hook! 'editorconfig-after-apply-functions
    (defun +editorconfig-set-web-mode-indent-h (props)
      (custom-web-mode-hook)))

  (add-hook! 'web-mode-hook 'custom-web-mode-hook))

(defun +lsp-volar--activate-p-advice (filename &optional _)
  "Only activate lsp-volar on vue project"
  (if lsp-volar-take-over-mode
      (and (or
           (and (lsp-workspace-root) (lsp-volar--vue-project-p (lsp-workspace-root)))
           (and (lsp-workspace-root) lsp-volar-activate-file (f-file-p (f-join (lsp-workspace-root) lsp-volar-activate-file))))
          (or (or (string-match-p "\\.mjs\\|\\.[jt]sx?\\'" filename)
                  (and (derived-mode-p 'js-mode 'typescript-mode 'typescript-ts-mode)
                       (not (derived-mode-p 'json-mode))))
              (string= (file-name-extension filename) "vue")))
    (string= (file-name-extension filename) "vue")))

(after! lsp-volar
  (advice-add 'lsp-volar--activate-p :override #'+lsp-volar--activate-p-advice)

  ;; https://github.com/emacs-lsp/lsp-mode/issues/4313
  (lsp-dependency 'typescript
                  '(:npm :package "typescript"
                    :path "tsserver")))

;; Emacs LSP performance booster
;; https://github.com/blahgeek/emacs-lsp-booster
(defun lsp-booster--advice-json-parse (old-fn &rest args)
  "Try to parse bytecode instead of json."
  (or
   (when (equal (following-char) ?#)
     (let ((bytecode (read (current-buffer))))
       (when (byte-code-function-p bytecode)
         (funcall bytecode))))
   (apply old-fn args)))
(advice-add (if (progn (require 'json)
                       (fboundp 'json-parse-buffer))
                'json-parse-buffer
              'json-read)
            :around
            #'lsp-booster--advice-json-parse)

(defun lsp-booster--advice-final-command (old-fn cmd &optional test?)
  "Prepend emacs-lsp-booster command to lsp CMD."
  (let ((orig-result (funcall old-fn cmd test?)))
    (if (and (not test?)                             ;; for check lsp-server-present?
             (not (file-remote-p default-directory)) ;; see lsp-resolve-final-command, it would add extra shell wrapper
             lsp-use-plists
             (not (functionp 'json-rpc-connection))  ;; native json-rpc
             (executable-find "emacs-lsp-booster"))
        (progn
          (when-let ((command-from-exec-path (executable-find (car orig-result))))  ;; resolve command from exec-path (in case not found in $PATH)
            (setcar orig-result command-from-exec-path))
          (message "Using emacs-lsp-booster for %s!" orig-result)
          (cons "emacs-lsp-booster" orig-result))
      orig-result)))
(advice-add 'lsp-resolve-final-command :around #'lsp-booster--advice-final-command)

(after! lsp-mode
  (add-to-list 'lsp--formatting-indent-alist '(web-mode . web-mode-indent-style))
  ;; https://github.com/emacs-lsp/lsp-mode/issues/3577
  (delete 'lsp-terraform lsp-client-packages))
