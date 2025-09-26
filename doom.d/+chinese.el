;;; ../.dotfiles/doom.d/+chinese.el -*- lexical-binding: t; -*-

(use-package! rime
  :custom
  (default-input-method "rime")
  (rime-show-candidate 'posframe)
  ;; https://github.com/DogLooksGood/emacs-rime#%E4%B8%B4%E6%97%B6%E8%8B%B1%E6%96%87%E6%A8%A1%E5%BC%8F
  (rime-disable-predicates
   '(rime-predicate-evil-mode-p
     rime-predicate-after-alphabet-char-p
     rime-predicate-org-in-src-block-p
     rime-predicate-in-code-string-p
     rime-predicate-prog-in-code-p))
  (rime-inline-ascii-trigger 'shift-l)
  (rime-user-data-dir "~/.local/share/rime"))

(after! rime
  (map! :map rime-mode-map
        "C-`" #'rime-send-keybinding)
  (when (featurep :system 'macos)
    (setq
     ;; https://github.com/rime/librime/releases
     rime-librime-root "~/.local/share/librime/"
     ;; https://github.com/DogLooksGood/emacs-rime/blob/master/INSTALLATION.org
     rime-emacs-module-header-root "/opt/homebrew/include/")))
